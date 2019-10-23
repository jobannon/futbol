require './test/test_helper'
require './lib/team'

class TeamTest < Minitest::Test

def setup
  team_info = {
    team_id: "1",
    franchiseId: "23",
    teamName: "Atlanta United",
    abbreviation: "ATL",
    stadium: "Mercedes-Benz Stadium",
    link: "/api/v1/teams/1"
  }
  @team = Team.new(team_info)
end

  def test_it_exists
    assert_instance_of Team, @team
  end

  def test_initialize
    assert_equal "1", @team.team_id
    assert_equal "23", @team.franchiseId
    assert_equal "Atlanta United", @team.teamName
    assert_equal "ATL", @team.abbreviation
    assert_equal "Mercedes-Benz Stadium", @team.stadium
    assert_equal "/api/v1/teams/1", @team.link
  end
end
