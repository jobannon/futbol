require 'csv'
require_relative 'game'

class GameCollection
  attr_reader :games

  def initialize(csv_path)
    @games = create_games(csv_path)
  end

  def create_games(csv_path)
    csv = CSV.read("#{csv_path}", headers: true, header_converters: :symbol)
    csv.map { |row| Game.new(row) }
  end

  def total_games
    @games.length
  end

  def find_count_of_game_by_season
    games_per_season = Hash.new(0)
      @games.each { |game| games_per_season[game.season] += 1}
      games_per_season.sort.to_h
  end

  def find_average_goals_per_game
    total_goals = @games.sum { |game| game.total_score }
      (total_goals.to_f/total_games).round(2)
  end

  def find_highest_total_score
    @games.max_by {|game| game.total_score}.total_score
  end

  def find_lowest_total_score
    @games.min_by {|game| game.total_score}.total_score
  end

  def calculate_goal_differences
    @games.max_by {|game| game.game_goal_difference}.game_goal_difference
  end
end
