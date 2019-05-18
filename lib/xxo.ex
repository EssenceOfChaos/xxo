defmodule Xxo do
  @moduledoc """
  Documentation for Xxo.
  """
  alias Xxo.GameSupervisor

  @doc """
  Generates a new game under supervision
  """
  defdelegate new_game(game_name), to: GameSupervisor, as: :create_game
end
