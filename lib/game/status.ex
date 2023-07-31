defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_round_message() do
    IO.puts("\n-----The game is started-----\n")

    Game.info()
    |> IO.inspect()
    IO.puts("\n-----------------------------\n")
  end
end
