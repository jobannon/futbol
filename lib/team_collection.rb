require 'csv'
require_relative 'team'

class TeamCollection
  attr_reader :teams

  def initialize(csv_path)
    @teams = create_teams(csv_path)
  end

  def create_teams(csv_path)
    csv = CSV.read(csv_path, headers: true, header_converters: :symbol)
    csv.map {|row| Team.new(row)}
  end

  def total_teams
    @teams.length
  end

  def find_by_id(id)
    @teams.find do |team|
      team if team.team_id == id
    end
  end

  def find_name_by_id(id)
    find_by_id(id).team_name
  end
end
