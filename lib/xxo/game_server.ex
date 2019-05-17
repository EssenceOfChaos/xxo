defmodule Xxo.GameServer do
  @moduledoc """
  The Game module is responsible for starting/stopping new games.
  """
  use GenServer
  alias Xxo.{Game}

  #######################################################################
  #####################   Client Callbacks   ############################
  #######################################################################
  def start_link(player) do
    GenServer.start_link(__MODULE__, player, name: __MODULE__)
  end

  #   def player_move(pid, player, move) do
  #     GenServer.cast(via_tuple(pid), {:player_move, player, move})
  #   end
  def player_move(player, move) do
    GenServer.cast(__MODULE__, {:player_move, player, move})
  end

  def get_state() do
    GenServer.call(__MODULE__, :get_state)
  end

  def reset_state(__MODULE__) do
    GenServer.cast(__MODULE__, :reset_state)
  end

  def stop(__MODULE__) do
    GenServer.cast(__MODULE__, :stop)
  end

  #######################################################################
  #####################   Server Callbacks   ############################
  #######################################################################

  @impl true
  def init(player) do
    {:ok, %Game{player: player}}
  end

  @impl true
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:player_move, player, new_move}, state = %Game{finished: false}) do
    {:noreply, Map.update!(state, new_move, update_state(state, player, new_move))}
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

  #######################################################################
  #####################   Private Functions   ###########################
  #######################################################################

  defp update_state(state, player, new_move) do
    board = state.board.positions
    Map.update!(board, new_move, fn _ -> player end)
  end
end
