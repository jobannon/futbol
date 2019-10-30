require './test/test_helper'

class GameTeamCollectioTest < MiniTest::Test
  def setup
    @gameteam_collection = GameTeamCollection.new("./test/data/gameteam_sample.csv")

  end

  def test_it_exists
    assert_instance_of GameTeamCollection, @gameteam_collection
  end

  def test_length
    assert_equal 20, @gameteam_collection.total_game_teams
  end

  def test_total_team_wins
    expected = {
      "1"=>3,
      "2"=>1,
      "3"=>1,
      "4"=>1,
      "5"=>2
    }
    assert_equal expected, @gameteam_collection.total_team_wins
  end

  def test_total_games_per_team
    expected = {
      "1"=>4,
      "2"=>5,
      "3"=>4,
      "4"=>3,
      "5"=>4
    }
    assert_equal expected, @gameteam_collection.total_games_per_team
  end

  def test_team_win_percentage
    expected = {
      "1"=>0.75,
      "2"=>0.2,
      "3"=>0.25,
      "4"=>0.33,
      "5"=>0.5
    }
    assert_equal expected, @gameteam_collection.team_win_percentage
  end

  def test_winningest_team_id
    assert_equal "1", @gameteam_collection.winningest_team_id
  end

  def test_all_games_for
    assert_equal 4, @gameteam_collection.all_games_for("1").count
    assert_equal 5, @gameteam_collection.all_games_for("2").count
    assert_equal 4, @gameteam_collection.all_games_for("3").count
  end

  def test_all_wins_for
    assert_equal 3, @gameteam_collection.all_wins_for("1").count
    assert_equal 1, @gameteam_collection.all_wins_for("2").count
    assert_equal 1, @gameteam_collection.all_wins_for("3").count
  end

  def test_win_percentage_for
    assert_equal 0.75, @gameteam_collection.win_percentage_for("1")
    assert_equal 0.2, @gameteam_collection.win_percentage_for("2")
    assert_equal 0.25, @gameteam_collection.win_percentage_for("3")
  end
end
