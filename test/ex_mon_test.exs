defmodule ExMonTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "create_player/4" do
    test "returns a player" do
      expected_response = %ExMon.Player{life: 100, name: "Heric", moves: %{move_heal: :heal, move_avg: :punch, move_rnd: :kick}}
      assert expected_response == ExMon.create_player("Heric", :kick, :punch, :heal)
    end
  end

  describe "start_game/1" do
    test "when the game is started, returns a message" do
      player = ExMon.create_player("Heric", :kick, :punch, :heal)

      messages = capture_io(fn ->
        assert ExMon.start_game(player) == :ok
      end)
      assert messages =~ "The game is started"
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end

  describe "make_move/1" do
    setup do
      player = ExMon.create_player("Heric", :kick, :punch, :heal)
      capture_io(fn ->
      ExMon.start_game(player)
      end)
      :ok
    end

    test "when the move is valid, do the move and the computer makes a move" do


      messages = capture_io(fn ->
        ExMon.make_move(:punch)
      end)

      assert messages =~ "turn: :computer"
      assert messages =~ "turn: :player"
      assert messages =~ "status: :continue"
    end

    test "when the move is invalid, returns an error message" do
      messages = capture_io(fn ->
        ExMon.make_move(:invalid_move)
      end)

      assert messages =~ "invalid_move"
    end
  end
end
