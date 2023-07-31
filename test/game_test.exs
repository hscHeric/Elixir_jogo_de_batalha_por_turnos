defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game,Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Heric", :kick, :punch, :heal)
      computer = Player.build("Robotinik", :kick, :punch, :heal)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns current game state" do
      player = Player.build("Heric", :kick, :punch, :heal)
      computer = Player.build("Robotinik", :kick, :punch, :heal)
      Game.start(computer, player)
      expected_response =  %{status: :started, player: %Player{life: 100, name: "Heric", moves: %{move_heal: :heal, move_avg: :punch, move_rnd: :kick}}, computer: %ExMon.Player{life: 100, name: "Robotinik", moves: %{move_heal: :heal, move_avg: :punch, move_rnd: :kick}}, turn: :player}

      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build("Heric", :kick, :punch, :heal)
      computer = Player.build("Robotinik", :kick, :punch, :heal)
      Game.start(computer, player)
      expected_response =  %{status: :started, player: %Player{life: 100, name: "Heric", moves: %{move_heal: :heal, move_avg: :punch, move_rnd: :kick}}, computer: %ExMon.Player{life: 100, name: "Robotinik", moves: %{move_heal: :heal, move_avg: :punch, move_rnd: :kick}}, turn: :player}
      assert expected_response == Game.info()

      new_state =  %{status: :started, player: %Player{life: 2, name: "Heric", moves: %{move_heal: :heal, move_avg: :punch, move_rnd: :kick}}, computer: %ExMon.Player{life: 15, name: "Robotinik", moves: %{move_heal: :heal, move_avg: :punch, move_rnd: :kick}}, turn: :player}

      Game.update(new_state)
      expected_response = %{new_state | turn: :computer, status: :continue}
      assert expected_response == Game.info()
    end
  end


end
