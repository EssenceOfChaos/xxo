defmodule Xxo.AI do
  @moduledoc """
  The Artificial Intelligence module for single player mode
  """

  #   %Xxo.Game{
  #     action_on: "mia",
  #   board: %{
  #     {0, 0} => " ",
  #     {0, 1} => "x",
  #     {0, 2} => " ",
  #     {1, 0} => " ",
  #     {1, 1} => " ",
  #     {1, 2} => " ",
  #     {2, 0} => " ",
  #     {2, 1} => " ",
  #     {2, 2} => " "
  #   },
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
    square = Enum.find_index(board, fn {_k, v} -> v === " " end)

    if square == nil do
      {:error, :draw}
    end

    Map.replace!(board, board[square], symbol)
  end
end
