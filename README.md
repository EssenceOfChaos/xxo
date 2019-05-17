# xxo

[![CircleCI](https://circleci.com/gh/EssenceOfChaos/xxo.svg?style=svg)](https://circleci.com/gh/EssenceOfChaos/xxo)

A tic-tac-toe game engine written in Elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `xxo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:xxo, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/xxo](https://hexdocs.pm/xxo).

---

## After Installation

Start a new game by calling `Xxo.new_game("name")`, where "name" is the name of the player initiating the game. This call will return `{:ok, pid}`, where `pid` is the process id of the game. You can verify the game has started successfully by calling `Xxo.GameSupervisor.children()`, which will return the details of the current games under supervision.

Retreive the current state of the game by calling `Xxo.GameServer.get_state(pid)`, passing in the pid returned from the call to `Xxo.new_game/1`. This will return a struct that includes the following:

```elixir
%Xxo.Game{
  board: %Xxo.Board{
    positions: %{
      {0, 0} => " ",
      {0, 1} => " ",
      {0, 2} => " ",
      {1, 0} => " ",
      {1, 1} => " ",
      {1, 2} => " ",
      {2, 0} => " ",
      {2, 1} => " ",
      {2, 2} => " "
    }
  },
  finished: false,
  player: "name",
  winner: nil
}
```
