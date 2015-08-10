# -*- encoding : utf-8 -*-
class GameWeek < ActiveRecord::Base
  include WithGameWeek

  HOURS_UNTIL_5_PM = 17
  HOURS_UNTIL_NOON = 12

  # Final game week
  WEEK_17 = 17

  # Game week starts on a tuesday (after MNF)
  DAYS_IN_WEEK_BEFORE_LOCK = 2
  DAYS_IN_WEEK_BEFORE_SUNDAY_LOCK = 5

  def self.find_unique_with(game_week)
    WithGameWeek.validate_game_week_number(game_week)

    gw_obj_list = GameWeek.where(number: game_week)

    # There should only we one of these
    no_of_gw_objs = gw_obj_list.size
    if no_of_gw_objs == 0
      fail ActiveRecord::RecordNotFound, "Didn't find a record with game week '#{game_week}'"
    elsif no_of_gw_objs > 1
      fail IllegalStateError, "Found #{no_of_gw_objs} game weeks with game week '#{game_week}'"
    end

    # Return what must be the only element
    gw_obj_list.first
  end

  has_many :match_players
  has_many :game_week_teams

  validates :number,
            presence: true,
            uniqueness: true

  validate :number_is_in_correct_range

  def self.get_all_points_for_gameweek(game_week)
    User.all.map do|v|
      { user_id: v.id, points: GameWeekTeam.find_unique_with(v.id, game_week).points }
    end
  end

  def number_is_in_correct_range
    return unless number.present?
    WithGameWeek.validate_game_week_number(number)
  rescue ArgumentError
    errors.add(:number, 'is not between 1 and #{Settings.number_of_gameweeks} inclusive')
  end

  def active?
    # Number of days from season start to start of this gameweek
    game_week_start_days_offset_from_season_start = (number - 1) * WithGameWeek::DAYS_IN_A_WEEK 
    # Number of days from season start to the end of this gameweek
    game_week_end_days_offset_from_season_start = number * WithGameWeek::DAYS_IN_A_WEEK

    is_after_game_week_start = WithGameWeek.more_than_days_since_start?(game_week_start_days_offset_from_season_start)
    is_after_game_week_end = WithGameWeek.more_than_days_since_start?(game_week_end_days_offset_from_season_start)

    is_after_game_week_start && !is_after_game_week_end
  end

  def lock_time
    # Number of days from season start to start of this gameweek
    game_week_start_days_offset_from_season_start = (number - 1) * WithGameWeek::DAYS_IN_A_WEEK
    WithGameWeek.start_of_first_gameweek + (game_week_start_days_offset_from_season_start + days_before_lock).days + game_start.hours
  end

  def locked?
    Time.zone.now > lock_time
  end

  private

  def days_before_lock
    if (WithGameWeek.current_game_week == WEEK_17)
      DAYS_IN_WEEK_BEFORE_SUNDAY_LOCK
    else
      DAYS_IN_WEEK_BEFORE_LOCK
    end
  end

  def game_start
    today = Time.zone.now
    if (today == Date.civil(today.year, 11, Date.calculate_mday(today.year, 11, :fourth, :thursday)))
      HOURS_UNTIL_NOON
    else
      HOURS_UNTIL_5_PM
    end
  end
end
