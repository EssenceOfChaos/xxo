defmodule Xxo.GameSupervisor do
   alias Xxo.Game

   use DynamicSupervisor

   def start_link(_arg) do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
   end

   @impl true
   def init(:ok) do
    DynamicSupervisor.init(strategy: :one_for_one)
   end

   def create_game(game_id) do
    child_spec = %{
        id: Game,
        start: {Game, :start_link, [game_id]},
        restart: :temporary
    }
    DynamicSupervisor.start_child(__MODULE__, child_spec)
   end

   def game_exists?(game_id) do
    case Registry.lookup(:game_server_registry, game_id) do
      [] -> false
      _ -> true
    end
  end

   ## Utility Functions ##
    # Terminate a Game process and remove it from supervision
   def remove_game(game_pid) do
    DynamicSupervisor.terminate_child(__MODULE__, game_pid)
  end

  # Nice utility method to check which processes are under supervision
  def children do
    DynamicSupervisor.which_children(__MODULE__)
  end

  # Nice utility method to check which processes are under supervision
  def count_children do
    DynamicSupervisor.count_children(__MODULE__)
  end

end
