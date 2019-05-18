defmodule Xxo.Game do
  @moduledoc """
  The Game module
  """

  defstruct board: %{
              {0, 0} => " ",
              {0, 1} => " ",
              {0, 2} => " ",
              {1, 0} => " ",
              {1, 1} => " ",
              {1, 2} => " ",
              {2, 0} => " ",
              {2, 1} => " ",
              {2, 2} => " "
            },
            game_name: nil,
            finished: false,
            winner: nil,
            action_on: nil
end
