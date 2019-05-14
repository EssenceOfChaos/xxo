defmodule Xxo.Game do
  @moduledoc """
  The Game module
  """
  alias Xxo.Board

  defstruct board: %Board{},
            x: nil,
            o: nil,
            finished: false,
            winner: nil
end
