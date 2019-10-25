require './test/test_helper'

class GameCollectionTest < Minitest::Test
  def setup
    @game_collection = GameCollection.new('./test/data/game_sample.csv')
  end

  def test_it_exists
    assert_instance_of GameCollection, @game_collection
  end

  def test_it_can_read_csv
    assert_equal 10, @game_collection.all.count
  end

  def test_total_games
    assert_equal 10, @game_collection.total_games
  end

  def test_total_goals_by_season
    expected = {
      "20192020"=>20,
      "20202021"=>7,
      "20212022"=>9,
      "20222023"=>14,
      "20232024"=>8
    }
    assert_equal expected, @game_collection.find_total_goals_by_season
  end
end
