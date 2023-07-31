defmodule ExMon.Game.Actions do
  alias ExMon.Game

  def fetch_move(move) do
    Game.player()
    |> Map.get(:moves)
    |> find_move(move)
  end

  defp find_move(moves,  move) do
    moves
    |> Enum.find_value({:error, move}, fn {key, value} ->
      if value == move do
        {:ok, key}
      end
    end)
  end
end
