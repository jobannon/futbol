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
end
