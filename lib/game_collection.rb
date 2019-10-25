require 'csv'
require_relative './game'
require_relative './collection'

class GameCollection < Collection

  def new_object(row)
    Game.new(row)
  end

  def total_games
    @all.length
  end

  def find_count_of_game_by_season
    games_per_season = Hash.new(0)
    @all.each {|game| games_per_season[game.season] += 1}
    games_per_season
  end

  def find_average_goals_per_game
    total_goals = @all.sum {|game| game.total_score}
    (total_goals.to_f/total_games).round(2)
  end

  def find_highest_total_score
    @all.max_by {|game| game.total_score}.total_score
  end

  def find_lowest_total_score
    @all.min_by {|game| game.total_score}.total_score
  end

  def calculate_total_goals_by_season
    @all.reduce(Hash.new(0)) do |acc, game|
      acc[game.season] += game.total_score.to_f
      acc
    end
  end

  def calculate_goal_differences
    @all.max_by {|game| game.game_goal_difference}.game_goal_difference
  end

  def find_percentage_home_wins
    home_games_won = @all.count {|game| game.home_team_win?}.to_f
    (home_games_won/total_games).round(2)
  end

  def find_percentage_away_wins
    away_games_won = @all.count {|game| game.visitor_team_win?}.to_f
    (away_games_won/total_games).round(2)
  end

  def find_percentage_of_ties
    tied_games = @all.count {|game| game.tie_game?}.to_f
    (tied_games/total_games).round(2)
  end
end
