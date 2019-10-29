require './test/test_helper'

class GameCollectionTest < Minitest::Test
  def setup
    @game_collection = GameCollection.new('./test/data/game_sample.csv')
  end

  def test_it_exists
    assert_instance_of GameCollection, @game_collection
  end

  def test_it_can_read_csv
    assert_equal 10, @game_collection.games.count
  end

  def test_total_games
    assert_equal 10, @game_collection.total_games
  end

  def test_total_number_of_home_games
    expected = {5 => 2, 1 => 2, 2 => 2, 3 => 2, 4 => 2}
    assert_equal expected, @game_collection.find_number_of_home_games
  end

  def test_total_number_of_away_games
    expected = {3 => 2, 2 => 3, 5 => 2, 1 => 2, 4 => 1}
    assert_equal expected, @game_collection.find_number_of_away_games
  end

  def test_total_home_score
    expected = {5 => 10, 1 => 3, 2 => 6, 3 => 4, 4 => 5}
    assert_equal expected, @game_collection.find_total_home_score
  end

  def test_total_away_score
    expected = {3 => 9, 2 => 8, 5 => 3, 1 => 5, 4 => 5}
    assert_equal expected, @game_collection.find_total_away_score
  end

  def test_avg_home_score_per_home_game
    expected = {5 => 5.0, 1 => 1.5, 2 => 3.0, 3 => 2.0, 4 => 2.5}
    assert_equal expected, @game_collection.find_average_home_goals_per_home_game
  end

  def test_avg_away_score_per_away_game
    expected = {3 => 4.5, 2 => 2.67, 5 => 1.5, 1 => 2.5, 4 => 5}
    assert_equal expected, @game_collection.find_average_away_goals_per_away_game
  end

  def test_it_finds_team_id_by_highest_avg_home_score_per_home_game
    assert_equal 5, @game_collection.find_highest_average_home_score_per_home_game
  end
end
