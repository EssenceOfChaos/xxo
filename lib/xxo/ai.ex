defmodule Xxo.AI do
  @moduledoc """
  The Artificial Intelligence module for single player mode
  """

  #   %Xxo.Game{
  #     action_on: "mia",
  # board: %{
  #   {0, 0} => " ",
  #   {0, 1} => "x",
  #   {0, 2} => " ",
  #   {1, 0} => " ",
  #   {1, 1} => " ",
  #   {1, 2} => " ",
  #   {2, 0} => " ",
  #   {2, 1} => " ",
  #   {2, 2} => " "
  # },
  #     finished: false,
  #     game_name: "mia",
  #     winner: nil
  #   }

  def calculate_move(board, symbol) do
    find_best_move(board, symbol)
  end

  ########## Private functions ##########

  # To start, return ANY valid move, then improve later
  defp find_best_move(board, symbol) do
    square =
      board
      |> Enum.filter(&(elem(&1, 1) === " "))
      |> Enum.random()
      |> elem(0)

    Map.replace!(board, square, symbol)
  end

  #     board = %{
  #     {0, 0} => " ",
  #     {0, 1} => "x",
  #     {0, 2} => " ",
  #     {1, 0} => " ",
  #     {1, 1} => " ",
  #     {1, 2} => " ",
  #     {2, 0} => " ",
  #     {2, 1} => " ",
  #     {2, 2} => " "
  #   }
end
