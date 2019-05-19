defmodule Xxo.GameServer do
  @moduledoc """
  The Game module is responsible for starting/stopping new games.
  """
  use GenServer
  alias Xxo.{Game}
  require Logger

  @game_server_registry :game_server_registry

  #####################   Client Callbacks   ############################
  def start_link(game_name) do
    GenServer.start_link(__MODULE__, game_name, name: via_tuple(game_name))
  end

  # via_tuple - private function used to register players in the GameServer Registry
  defp via_tuple(game_name) do
    {:via, Registry, {@game_server_registry, game_name}}
  end

  def player_move(game_name, player, square) do
    GenServer.call(via_tuple(game_name), {:player_move, player, square})
  end

  def get_state(game_name) do
    GenServer.call(via_tuple(game_name), :get_state)
  end

  def reset_state(game_name) do
    GenServer.cast(via_tuple(game_name), :reset_state)
  end

  def stop(game_name) do
    GenServer.cast(via_tuple(game_name), :stop)
  end

  @doc """
  Returns the pid for the `game_name` stored in the registry
  """
  def whereis(game_name) do
    case Registry.lookup(@game_server_registry, game_name) do
      [{pid, _}] -> pid
      [] -> nil
    end
  end

  #####################   Server Callbacks   ############################

  @impl true
  def init(game_name) do
    Logger.info("Process created... Game name: #{game_name}")
    {:ok, %Game{game_name: game_name, action_on: game_name}}
  end

  @impl true
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call({:player_move, player, new_move}, _from, %Game{finished: false} = state) do
    update_board = Map.replace!(state.board, new_move, player)
    new_state = %{state | board: update_board}

    {:reply, {:ok, new_state}, new_state}
  end

  @impl true
  def handle_cast(:reset_state, _state) do
    {:noreply, %{}}
  end

  @impl true
  def handle_cast(:stop, state) do
    {:stop, :normal, state}
  end

  @impl true
  def terminate(reason, stats) do
    # We could write to a file, database etc
    IO.puts("server terminated because of #{inspect(reason)}")
    inspect(stats)
    :ok
  end

  @impl true
  def handle_info(msg, state) do
    IO.puts("received #{inspect(msg)}")
    {:noreply, state}
  end

  #####################   Private Functions   ###########################

  # Map.update!(board, new_move, fn _ -> player end)
  defp check_winner(state) do
    # ..
  end
end
