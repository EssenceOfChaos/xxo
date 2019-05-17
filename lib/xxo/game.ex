defmodule Xxo.Game do
  @moduledoc """
  The Game module
  """
  alias Xxo.Board

  defstruct board: %Board{},
            player: nil,
            finished: false,
            winner: nil
end
