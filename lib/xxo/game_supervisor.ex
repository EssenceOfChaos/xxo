defmodule Xxo.GameSupervisor do
  @moduledoc """
  The Game Supervisor, a dynamic supervisor providing fault tolerance
  """
  alias Xxo.GameServer

  use DynamicSupervisor

  def start_link(_arg) do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(:ok) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def create_game(game_name) do
    child_spec = %{
      id: Game,
      start: {GameServer, :start_link, [game_name]},
      restart: :temporary
    }

    DynamicSupervisor.start_child(__MODULE__, child_spec)
  end

  ## Utility Functions ##
  # Terminate a Game process and remove it from supervision
  def remove_game(game_pid) do
    DynamicSupervisor.terminate_child(__MODULE__, game_pid)
  end

  @doc """
    Check which processes are under supervision
  """
  def children do
    DynamicSupervisor.which_children(__MODULE__)
  end

  @doc """
    Check how many processes are under supervision
  """
  def count_children do
    DynamicSupervisor.count_children(__MODULE__)
  end
end
