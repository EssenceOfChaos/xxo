defmodule Xxo.GameServer do
  @moduledoc """
  The Game module is responsible for starting/stopping new games.
  """
  use GenServer

  ### Client calls ###
  def start_link(game_id) do
    GenServer.start_link(__MODULE__, game_id, name: via_tuple(game_id))
  end

  def add_player(game, player) do
    game
    |> via_tuple
    |> GenServer.call({:add_player, player})
  end


  ### Server callbacks ###
  @impl true
  def init(game_id) do
    {:ok, %{game_id: game_id}}
  end

  @impl true
  def handle_call({:join_player, player}, _from, %{x: nil} = state) do
    new_state = %{state | x: player}

    {:reply, {:ok, :x, new_state}, new_state}
  end

  @impl true
  def handle_call({:join_player, player}, _from, %{o: nil} = state) do
    new_state = %{state | o: player}

    {:reply, {:ok, :o, new_state}, new_state}
  end

  @impl true
  def handle_call({:join_player, _player}, _from, state) do
    {:reply, {:error, "This game already has two players"}, state}
  end


  ### Private function ###
  defp via_tuple(game_id) do
    {:via, Registry, {:game_server_registry, game_id}}
  end

end
