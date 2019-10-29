require './test/test_helper'

class TeamCollectionTest < Minitest::Test
  def setup
    @team_collection = TeamCollection.new('./test/data/team_sample.csv')
  end

  def test_it_exists
    assert_instance_of TeamCollection, @team_collection
  end

  def test_total_teams
    assert_equal 5, @team_collection.total_teams
  end

  def test_find_team_by_name
    assert_equal "Seattle Sounders FC", @team_collection.find_team_name_by_id(4)
  end
end
