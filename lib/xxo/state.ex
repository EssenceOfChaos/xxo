defmodule Xxo.State do
  @moduledoc """
  This module is used to track game state and declare when a user has won/lost.
  """
  require Logger

  @doc """
  Checks if player has three in a row
  """
  def winner?(player, state) do
    won(player, state.board)
  end

  # Top row win
  defp won(
         player,
         %{
           {0, 0} => player,
           {0, 1} => player,
           {0, 2} => player,
           {1, 0} => _,
           {1, 1} => _,
           {1, 2} => _,
           {2, 0} => _,
           {2, 1} => _,
           {2, 2} => _
         } = board
       ),
       do: {:winner, player}

  # Middle row win
  defp won(
         player,
         %{
           {0, 0} => _,
           {0, 1} => _,
           {0, 2} => _,
           {1, 0} => player,
           {1, 1} => player,
           {1, 2} => player,
           {2, 0} => _,
           {2, 1} => _,
           {2, 2} => _
         } = board
       ),
       do: {:winner, player}

  # Bottom row win
  defp won(
         player,
         %{
           {0, 0} => _,
           {0, 1} => _,
           {0, 2} => _,
           {1, 0} => _,
           {1, 1} => _,
           {1, 2} => _,
           {2, 0} => player,
           {2, 1} => player,
           {2, 2} => player
         } = board
       ),
       do: {:winner, player}

  # Left column win
  defp won(
         player,
         %{
           {0, 0} => player,
           {0, 1} => _,
           {0, 2} => _,
           {1, 0} => player,
           {1, 1} => _,
           {1, 2} => _,
           {2, 0} => player,
           {2, 1} => _,
           {2, 2} => _
         } = board
       ),
       do: {:winner, player}

  # Middle column win
  defp won(
         player,
         %{
           {0, 0} => _,
           {0, 1} => player,
           {0, 2} => _,
           {1, 0} => _,
           {1, 1} => player,
           {1, 2} => _,
           {2, 0} => _,
           {2, 1} => player,
           {2, 2} => _
         } = board
       ),
       do: {:winner, player}

  # Right column win
  defp won(
         player,
         %{
           {0, 0} => _,
           {0, 1} => _,
           {0, 2} => player,
           {1, 0} => _,
           {1, 1} => _,
           {1, 2} => player,
           {2, 0} => _,
           {2, 1} => _,
           {2, 2} => player
         } = board
       ),
       do: {:winner, player}

  # Diagonal win, top left -> bottom right
  defp won(
         player,
         %{
           {0, 0} => player,
           {0, 1} => _,
           {0, 2} => _,
           {1, 0} => _,
           {1, 1} => player,
           {1, 2} => _,
           {2, 0} => _,
           {2, 1} => _,
           {2, 2} => player
         } = board
       ),
       do: {:winner, player}

  # Diagonal win, bottom left -> top right
  defp won(
         player,
         %{
           {0, 0} => _,
           {0, 1} => _,
           {0, 2} => player,
           {1, 0} => _,
           {1, 1} => player,
           {1, 2} => _,
           {2, 0} => player,
           {2, 1} => _,
           {2, 2} => _
         } = board
       ),
       do: {:winner, player}

  # No other function matches - game is still in progress
  defp won(_player, _board), do: {:nowinner}
end
