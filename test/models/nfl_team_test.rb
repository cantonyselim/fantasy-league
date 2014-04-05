require 'test_helper'

class NflTeamTest < ActiveSupport::TestCase
  test 'NFL team has a number of players' do
    team = NflTeam.find(1)
    assert_equal team.nfl_players.size, 9
  end

  test 'NFL team cannot be created without a name' do
    team = NflTeam.new
    assert !team.save
  end

  test 'NFL team can be created with a name' do
    team = NflTeam.new
    team.name = 'San Didrego Udon'
    assert team.save
  end
end