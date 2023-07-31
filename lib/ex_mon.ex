defmodule ExMon do
  alias ExMon.Player #A ultima palavra será a chamada do modulo

  #ExMon.Player, as: Banana também é valido

  def create_player(name, move_rnd, move_avg, move_heal) do
    Player.build(name, move_rnd, move_avg, move_heal)
  end

end
