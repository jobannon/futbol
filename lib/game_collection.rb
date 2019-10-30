require 'csv'
require_relative 'game'

class GameCollection
  attr_reader :games

  def initialize(csv_path)
    @games = create_games(csv_path)
  end

  def create_games(csv_path)
    csv = CSV.read(csv_path, headers: true, header_converters: :symbol)
    csv.map {|row| Game.new(row)}
  end

  def total_games
    @games.length
  end

  def find_count_of_game_by_season
    games_per_season = Hash.new(0)
    @games.each {|game| games_per_season[game.season] += 1}
    games_per_season
  end

  def find_average_goals_per_game
    total_goals = @games.sum {|game| game.total_score}
    (total_goals.to_f/total_games).round(2)
  end

  def find_highest_total_score
    @games.max_by {|game| game.total_score}.total_score
  end

  def find_lowest_total_score
    @games.min_by {|game| game.total_score}.total_score
  end

  def find_average_goals_by_season
    calculate_total_goals_by_season.merge(find_count_of_game_by_season) do |season, goals, games|
      (goals/games).round(2)
    end
  end

  def calculate_total_goals_by_season
    @games.reduce(Hash.new(0)) do |acc, game|
      acc[game.season] += game.total_score.to_f
      acc
    end
  end

  def calculate_goal_differences
    @games.max_by {|game| game.game_goal_difference}.game_goal_difference
  end

  def find_percentage_home_wins
    home_games_won = @games.count {|game| game.home_team_win?}.to_f
    (home_games_won/total_games).round(2)
  end

  def find_percentage_away_wins
    away_games_won = @games.count {|game| game.visitor_team_win?}.to_f
    (away_games_won/total_games).round(2)
  end

  def find_percentage_of_ties
    tied_games = @games.count {|game| game.tie_game?}.to_f
    (tied_games/total_games).round(2)
  end

  def all_games_for(id)
    @games.find_all do |game|
      (game.home_team_id == id) || (game.away_team_id == id)
    end
  end

  def all_games_by_season_for(id)
    all_games_for(id).group_by do |game|
      game.season
    end
  end

  def count_of_all_games_by_season_for(id)
    all_games_by_season_for(id).reduce({}) do |acc, games|
      acc[games[0]] = games[1].count
      acc
    end
  end

  def count_of_all_wins_by_season_for(id)
    all_games_by_season_for(id).reduce(Hash.new(0)) do |acc, games|
      win_count = 0
      games[1].each do |game|
        if (game.home_team_id == id && game.home_team_win?)
          win_count += 1
        elsif (game.away_team_id == id && game.visitor_team_win?)
          win_count += 1
        end
      end
      acc[games[0]] += win_count
      acc
    end
  end

  def win_percentage_by_season_for(id)
    season_wins = count_of_all_wins_by_season_for(id)
    season_games = count_of_all_games_by_season_for(id)
    season_wins.merge(season_games) do |season, wins, games|
      (wins.to_f / games).round(2)
    end
  end

  def highest_season_win_percentage_for(id)
    win_percentage_by_season_for(id).max_by do |season, percentage|
      percentage
    end.first
  end

  def lowest_season_win_percentage_for(id)
    win_percentage_by_season_for(id).min_by do |season, percentage|
      percentage
    end.first
  end
end
