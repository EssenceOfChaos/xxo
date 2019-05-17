defmodule XxoTest do
  @moduledoc """
  Testing the Xxo module
  """
  use ExUnit.Case
  doctest Xxo

  test "starts a new game with a name" do
    {:ok, pid} = Xxo.new_game("freddy")
    assert is_pid(pid)
  end
end
