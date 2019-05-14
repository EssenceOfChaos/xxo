defmodule Xxo do
  @moduledoc """
  Documentation for Xxo.
  """

  @doc """
  Generates a unique game id
  """
  def generate_game_id() do
    DateTime.utc_now()
    |> DateTime.to_unix()
    |> Integer.to_string()
    |> Base.encode64()
  end
end
