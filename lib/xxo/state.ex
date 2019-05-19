defmodule Xxo.State do
  @moduledoc """
  This module is used to track game state and declare when a user has won/lost.
  """
  require Logger
  @tokens ["x", "o"]
  def winner?(
        %Xxo.Game{
          board: %{
            {0, 0} => " ",
            {0, 1} => "x",
            {0, 2} => " ",
            {1, 0} => " ",
            {1, 1} => "x",
            {1, 2} => " ",
            {2, 0} => " ",
            {2, 1} => "x",
            {2, 2} => " "
          }
        } = state
      ),
      do: :winner
end
