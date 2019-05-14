defmodule Xxo.GameServer do
  @moduledoc """
  The Game module is responsible for starting/stopping new games.
  """
  use GenServer

  #######################################################################
  #####################   Client Callbacks   ############################
  #######################################################################
  def start_link(game_id) do
    GenServer.start_link(__MODULE__, [], name: via_tuple(game_id))
  end

  def add_message(game_id, message) do
    # And the `GenServer` callbacks will accept this tuple the same way it
    # accepts a `pid` or an atom.
    GenServer.cast(via_tuple(game_id), {:add_message, message})
  end

  def get_messages(game_id) do
    GenServer.call(via_tuple(game_id), :get_messages)
  end

  def get_state(name) do
    GenServer.call(name, :get_state)
  end

  def reset_state(name) do
    GenServer.cast(name, :reset_state)
  end

  def stop(name) do
    GenServer.cast(name, :stop)
  end

  #######################################################################
  #####################   Server Callbacks   ############################
  #######################################################################

  @impl true
  def init(_arg) do
    {:ok, []}
  end

  @impl true
  def handle_call(:get_messages, _from, messages) do
    {:reply, messages, messages}
  end

  @impl true
  def handle_call(:get_state, _from, state) do
    # action, response, new state(no change)
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:add_message, new_message}, messages) do
    {:noreply, [new_message | messages]}
  end

  @impl true
  def handle_cast(:reset_state, _state) do
    # note: no response
    # action, current state(set to empty map)
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

  defp via_tuple(game_id) do
    {:via, :gproc, {:n, :l, {:game_id, game_id}}}
  end

  #   defp update_state(old_state, stock, price) do
  #     case Map.has_key?(old_state, stock) do
  #       true ->
  #         Map.update!(old_state, stock, price)

  #       false ->
  #         Map.put_new(old_state, stock, price)
  #     end
  #   end
end
