defmodule Xxo.Board do
   @moduledoc """
   The board game
   """

    def new() do
        %{
            {0, 0} => " ", {0, 1} => " ", {0, 2} => " ",
            {1, 0} => " ", {1, 1} => " ", {1, 2} => " ",
            {2, 0} => " ", {2, 1} => " ", {2, 2} => " "
        }
    end
end
