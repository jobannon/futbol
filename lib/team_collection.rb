require 'csv'
require_relative './team'
require_relative './collection'

class TeamCollection < Collection

  def new_object(row)
    Team.new(row)
  end

  def total_teams
    @all.length
  end
end
