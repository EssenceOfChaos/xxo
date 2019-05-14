defmodule Xxo.Game do

   alias Xxo.Board

   defstruct board: %Board{},
             x: nil,
             o: nil,
             finished: false,
             winner: nil
end
