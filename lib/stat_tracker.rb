require_relative './game_collection'

class StatTracker
  attr_reader :game_repo

  def self.from_csv(file_paths)
    game_path = file_paths[:games]
    teams_path = file_paths[:teams]
    game_teams_path = file_paths[:game_teams]

    StatTracker.new(game_path, teams_path, game_teams_path)
  end

  def initialize(game_path, teams_path, game_teams_path)
    @teams_path = teams_path
    @game_teams_path = game_teams_path
    @game_repo = GameCollection.new(game_path)
  end

  def count_of_games_by_season
    @game_repo.find_count_of_game_by_season
  end

  def average_goals_per_game
    @game_repo.find_average_goals_per_game
  end

  def highest_total_score
    @game_repo.find_highest_total_score
  end

  def lowest_total_score
    @game_repo.find_lowest_total_score
  end

  def biggest_blowout
    @game_repo.calculate_goal_differences
  end


end
