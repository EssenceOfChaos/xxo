defmodule Xxo do
  @moduledoc """
  Documentation for Xxo.
  """
  alias Xxo.GameSupervisor

  @doc """
  Generates a unique game id
  """
  defdelegate new_game(initiating_player), to: GameSupervisor, as: :create_game
end
