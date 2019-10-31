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

  def test_it_can_find_number_of_home_games
    expected = {"5"=>2, "1"=>2, "2"=>2, "3"=>2, "4"=>2}
    assert_equal expected, @game_collection.find_number_of_home_games
  end

  def test_it_can_find_number_of_away_games
    expected = {"3"=>2, "2"=>3, "5"=>2, "1"=>2, "4"=>1}
    assert_equal expected, @game_collection.find_number_of_away_games
  end

  def test_it_can_find_total_home_score
    expected = {"5"=>10, "1"=>3, "2"=>6, "3"=>4, "4"=>5}
    assert_equal expected, @game_collection.find_total_home_score
  end

  def test_it_can_find_total_away_score
    expected = {"3"=>9, "2"=>8, "5"=>3, "1"=>5, "4"=>5}
    assert_equal expected, @game_collection.find_total_away_score
  end

  def test_it_can_find_avg_home_goals_per_game
    expected = {"5"=>5.0, "1"=>1.5, "2"=>3.0, "3"=>2.0, "4"=>2.5}
    assert_equal expected, @game_collection.find_average_home_goals_per_home_game
  end

  def test_it_can_find_avg_away_goals_per_game
    expected = {"3"=>4.5, "2"=>2.67, "5"=>1.5, "1"=>2.5, "4"=>5.0}
    assert_equal expected, @game_collection.find_average_away_goals_per_away_game
  end

  def test_it_find_highest_average_home_score_per_home_game
    assert_equal "5", @game_collection.find_highest_average_home_score_per_home_game
  end

  def test_it__find_highest_average_away_score_per_away_game
    assert_equal "4", @game_collection.find_highest_average_away_score_per_away_game
  end

  def test_it_find_lowest_average_home_score_per_home_game
    assert_equal "1", @game_collection.find_lowest_average_home_score_per_home_game
  end

  def test_it_find_lowest_average_away_score_per_away_game
    assert_equal "5", @game_collection.find_lowest_average_away_score_per_away_game
  end

  def test_it_finds_goals_scored_per_team
    expected = {
      "5"=>{:my_goals=>13, :their_goals=>15},
      "3"=>{:my_goals=>13, :their_goals=>12},
      "2"=>{:my_goals=>14, :their_goals=>18},
      "1"=>{:my_goals=>8, :their_goals=>5},
      "4"=>{:my_goals=>10, :their_goals=>8}
    }
    assert_equal expected, @game_collection.goals_scored_per_team
  end

  def test_it_find_goals_scored_against_a_team
    expected = {"5"=>15, "3"=>12, "2"=>18, "1"=>5, "4"=>8}
    assert_equal expected, @game_collection.find_goals_scored_against_a_team
  end

  def test_it_find_goals_scored_by_a_team
    expected = {"5"=>13, "3"=>13, "2"=>14, "1"=>8, "4"=>10}
    assert_equal expected, @game_collection.find_goals_scored_by_a_team
  end

  def test_it_defense_pair_averages
    expected = {"5"=>7.5, "3"=>6.0, "2"=>9.0, "1"=>2.5, "4"=>4.0}
    assert_equal expected, @game_collection.defense_pair_averages
  end

  def test_it_offense_pair_averages
    expected = {"5"=>6.5, "3"=>6.5, "2"=>7.0, "1"=>4.0, "4"=>5.0}
    assert_equal expected, @game_collection.offense_pair_averages
  end

  def test_highest_season_win_percentage
    assert_equal "20212022", @game_collection.highest_season_win_percentage_for("1")
  end

  def test_lowest_season_win_percentage
    assert_equal "20202021", @game_collection.lowest_season_win_percentage_for("1")
  end

  def test_biggest_goal_difference_by_winning_game
    assert_equal 4, @game_collection.biggest_goal_difference_by_winning_game("5")
  end

  def test_biggest_goal_difference_by_losing_game
    assert_equal 4, @game_collection.biggest_goal_difference_by_losing_game("5")
  end
end
