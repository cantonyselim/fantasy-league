# -*- encoding : utf-8 -*-
require 'test_helper'

class FixturesControllerTest < ActionController::TestCase
  # THESE could be more efficient, generate is slow so doing all validations
  # after same generate call will improve test time, but not isolation
  test 'generate creates the same number of fixtures for everyone with 8 users' do
    validate_everyone_plays_same_no_games(8)
  end

  test 'generate creates the same number of fixtures for everyone with 7 users' do
    validate_everyone_plays_same_no_games(7)
  end

  test 'generate creates the same number of fixtures for everyone with 6 users' do
    validate_everyone_plays_same_no_games(6)
  end

  test 'generate creates the same number of fixtures for everyone with 5 users' do
    validate_everyone_plays_same_no_games(5)
  end

  test 'generate creates the same number of fixtures for everyone with 4 users' do
    validate_everyone_plays_same_no_games(4)
  end

  test 'generate creates the same number of fixtures for everyone with 3 users' do
    validate_everyone_plays_same_no_games(3)
  end

  test 'generate creates the same number of fixtures for everyone with 2 users' do
    validate_everyone_plays_same_no_games(2)
  end

  test 'Every team is played the same number of times with 8 users' do
    validate_fixture_vs_spread_is_even(8)
  end

  test 'Every team is played the same number of times with 7 users' do
    validate_fixture_vs_spread_is_even(7)
  end

  test 'Every team is played the same number of times with 6 users' do
    validate_fixture_vs_spread_is_even(6)
  end

  test 'Every team is played the same number of times with 5 users' do
    validate_fixture_vs_spread_is_even(5)
  end

  test 'Every team is played the same number of times with 4 users' do
    validate_fixture_vs_spread_is_even(4)
  end

  test 'Every team is played the same number of times with 3 users' do
    validate_fixture_vs_spread_is_even(3)
  end

  test 'Every team is played the same number of times with 2 users' do
    validate_fixture_vs_spread_is_even(2)
  end

  test 'should generate the correct number of fixtures with 8 users' do
    validate_correct_no_fixtures_generated(8)
  end

  test 'should generate the correct number of fixtures with 7 users' do
    validate_correct_no_fixtures_generated(7)
  end

  test 'should generate the correct number of fixtures with 6 users' do
    validate_correct_no_fixtures_generated(6)
  end

  test 'should generate the correct number of fixtures with 5 users' do
    validate_correct_no_fixtures_generated(5)
  end

  test 'should generate the correct number of fixtures with 4 users' do
    validate_correct_no_fixtures_generated(4)
  end

  test 'should generate the correct number of fixtures with 3 users' do
    validate_correct_no_fixtures_generated(3)
  end

  test 'should generate the correct number of fixtures with 2 users' do
    validate_correct_no_fixtures_generated(2)
  end
end
