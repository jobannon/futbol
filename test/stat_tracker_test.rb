require './test/test_helper'

class StatTrackerTest < Minitest::Test
  def setup
    test_paths = {
      games: "./test/data/game_sample.csv",
      teams: "./test/data/team_sample.csv",
      game_teams: "./test/data/gameteam_sample.csv"
    }
    @stat_tracker = StatTracker.from_csv(test_paths)
  end

  def test_it_exists
    assert_instance_of StatTracker, @stat_tracker
  end

  def test_games
    assert_instance_of GameCollection, @stat_tracker.game_repo
  end

  def test_count_of_games_by_season
    expected = {
      "20192020"=>2,
      "20202021"=>2,
      "20212022"=>2,
      "20222023"=>2,
      "20232024"=>2
    }
    assert_equal expected, @stat_tracker.count_of_games_by_season
  end

  def test_average_goals_per_game
    assert_equal 5.8, @stat_tracker.average_goals_per_game
  end

  def test_highest_total_score
    assert_equal 12, @stat_tracker.highest_total_score
  end

  def test_lowest_total_score
    assert_equal 3 ,@stat_tracker.lowest_total_score
  end

  def test_biggest_blowout
    assert_equal 4, @stat_tracker.biggest_blowout
  end

  def test_average_goals_by_season
    expected = {
      "20192020"=>10,
      "20202021"=>3.5,
      "20212022"=>4.5,
      "20222023"=>7,
      "20232024"=>4
    }
    assert_equal expected, @stat_tracker.average_goals_by_season
  end

  def test_percentage_home_wins
    assert_equal 0.30, @stat_tracker.percentage_home_wins
  end

  def test_percentage_visitor_wins
    assert_equal 0.50, @stat_tracker.percentage_visitor_wins
  end

  def test_percentage_ties
    assert_equal 0.20, @stat_tracker.percentage_ties
  end

  def test_count_of_teams
    assert_equal 5, @stat_tracker.count_of_teams
  end

  def test_highest_scoring_home_test
    assert_equal "Chicago Red Stars", @stat_tracker.highest_scoring_home_team
  end

  def test_highest_scoring_visitor
    assert_equal "Seattle Sounders FC", @stat_tracker.highest_scoring_visitor
  end

  def test_lowest_scoring_home_test
    assert_equal "Atlanta United", @stat_tracker.lowest_scoring_home_team
  end

  def test_lowest_scoring_visitor
    assert_equal "Chicago Red Stars", @stat_tracker.lowest_scoring_visitor
  end

  def test_winningest_team
    assert_equal "Atlanta United", @stat_tracker.winningest_team
  end

  def test_worst_offense
    assert_equal "Atlanta United", @stat_tracker.worst_offense
  end

  def test_worst_defense
    assert_equal "Montreal Impact", @stat_tracker.worst_defense
  end

  def test_best_offense
    assert_equal "Montreal Impact", @stat_tracker.best_offense
  end

  def test_best_defense
    assert_equal "Atlanta United", @stat_tracker.best_defense
  end
    
  def test_average_win_percentage
    assert_equal 0.75, @stat_tracker.average_win_percentage("1")
    assert_equal 0.2, @stat_tracker.average_win_percentage("2")
    assert_equal 0.25, @stat_tracker.average_win_percentage("3")
  end

  def test_best_season
    assert_equal "20192020", @stat_tracker.best_season("3")
  end

  def test_worst_season
    assert_equal "20212022", @stat_tracker.worst_season("3")
  end

  def test_most_goals_by
    assert_equal 5, @stat_tracker.most_goals_scored("4")
  end

  def test_fewest_goals_by
    assert_equal 1, @stat_tracker.fewest_goals_scored("4")
  end

  def test_biggest_team_blowout
      assert_equal 4, @stat_tracker.biggest_team_blowout("5")
  end

  def test_worst_loss
    assert_equal 4, @stat_tracker.worst_loss("5")
  end
end
