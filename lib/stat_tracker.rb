class StatTracker
  def self.from_csv(file_paths)
    game_path = file_paths[:games]
    teams_path = file_paths[:teams]
    game_teams_path = file_paths[:game_teams]

    StatTracker.new(game_path, teams_path, game_teams_path)
  end

  def initialize(game_path, teams_path, game_teams_path)
    @game_path = game_path
    @teams_path = teams_path
    @game_teams_path = game_teams_path
  end

  def games
    GameCollection.new(@game_path)
  end
end
