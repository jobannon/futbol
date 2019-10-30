require './test/test_helper'
require './lib/GameTeamCollection'

class GameTeamCollectionTest < Minitest::Test
  def setup
    @gameteamcollection = GameTeamCollection.new('./test/data/gameteam.csv')
  end

  def test_it_exists
    assert_instance_of GameTeamCollection, @gameteamcollection
  end

  def test_it_can_read_csv
    assert_equal 18, @gameteamcollection.games_teams.count
  end

end
