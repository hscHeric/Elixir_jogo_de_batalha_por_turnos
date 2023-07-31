defmodule ExMon do
  alias ExMon.Game.Status
  alias ExMon.{Player, Game, Game.Status, Game.Actions} #A ultima palavra será a chamada do modulo
  #ExMon.Player, as: Banana também é valido

  @computer_name "Robotinik"

  def create_player(name, move_rnd, move_avg, move_heal) do
    Player.build(name, move_rnd, move_avg, move_heal)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message()
  end

    def make_move(move) do
      Actions.fetch_move(move)
    end

end
