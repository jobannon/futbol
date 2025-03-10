require_relative './game_collection'
require_relative './team_collection'
require_relative './game_team_collection'

class StatTracker
  attr_reader :game_repo, :team_repo, :game_teams_repo

  def self.from_csv(file_paths)
    game_path = file_paths[:games]
    teams_path = file_paths[:teams]
    game_teams_path = file_paths[:game_teams]
    StatTracker.new(game_path, teams_path, game_teams_path)
  end

  def initialize(game_path, teams_path, game_teams_path)
    @team_repo = TeamCollection.new(teams_path)
    @game_teams_repo = GameTeamCollection.new(game_teams_path)
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

  def average_goals_by_season
    @game_repo.find_average_goals_by_season
  end

  def biggest_blowout
    @game_repo.calculate_goal_differences
  end

  def percentage_home_wins
    @game_repo.find_percentage_home_wins
  end

  def percentage_visitor_wins
    @game_repo.find_percentage_away_wins
  end

  def percentage_ties
    @game_repo.find_percentage_of_ties
  end

  def count_of_teams
    @team_repo.total_teams
  end

  def highest_scoring_home_team
    highest_scoring_home_team_id = @game_repo.find_highest_average_home_score_per_home_game
    @team_repo.find_name_by_id(highest_scoring_home_team_id)
  end

  def highest_scoring_visitor
    highest_scoring_away_team_id = @game_repo.find_highest_average_away_score_per_away_game
    @team_repo.find_name_by_id(highest_scoring_away_team_id)
  end

  def lowest_scoring_home_team
    lowest_scoring_home_team_id = @game_repo.find_lowest_average_home_score_per_home_game
    @team_repo.find_name_by_id(lowest_scoring_home_team_id)
  end

  def lowest_scoring_visitor
    lowest_scoring_away_team_id = @game_repo.find_lowest_average_away_score_per_away_game
    @team_repo.find_name_by_id(lowest_scoring_away_team_id)
  end

  def worst_defense
    worst_defense = @game_repo.defense_pair_averages.sort_by { |key, value| value }.last
    id = worst_defense[0]
    @team_repo.find_name_by_id(id)
  end

  def best_defense
    best_defense = @game_repo.defense_pair_averages.sort_by { |key, value| value }.first
    id = best_defense[0]
    @team_repo.find_name_by_id(id)
  end

  def worst_offense
    worst_offense = @game_repo.offense_pair_averages.sort_by { |key, value| value }.first
    id = worst_offense[0]
    @team_repo.find_name_by_id(id)
  end

  def best_offense
    best_offense = @game_repo.offense_pair_averages.sort_by { |key, value| value }.last
    id = best_offense[0]
    @team_repo.find_name_by_id(id)
  end

  def winningest_team
    id = @game_teams_repo.winningest_team_id
    @team_repo.find_name_by_id(id)
  end

  def average_win_percentage(team_id)
    @game_teams_repo.win_percentage_for(team_id)
  end

  def best_season(team_id)
    @game_repo.highest_season_win_percentage_for(team_id)
  end

  def worst_season(team_id)
    @game_repo.lowest_season_win_percentage_for(team_id)
  end

  def most_goals_scored(team_id)
    @game_teams_repo.most_goals_by(team_id)
  end

  def fewest_goals_scored(team_id)
    @game_teams_repo.fewest_goals_by(team_id)
  end

  def biggest_team_blowout(team_id)
    @game_repo.biggest_goal_difference_by_winning_game(team_id)
  end

  def worst_loss(team_id)
    @game_repo.biggest_goal_difference_by_losing_game(team_id)
  end
end
