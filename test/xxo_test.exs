defmodule XxoTest do
  @moduledoc """
  Testing the Xxo module
  """
  use ExUnit.Case
  doctest Xxo

  test "greets the world" do
    id = Xxo.generate_game_id()
    assert is_binary(id)
  end
end
