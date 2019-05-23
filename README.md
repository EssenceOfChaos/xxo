# xxo

[![CircleCI](https://circleci.com/gh/EssenceOfChaos/xxo.svg?style=svg)](https://circleci.com/gh/EssenceOfChaos/xxo)

A tic-tac-toe game engine written in Elixir.

This is an MVP. My intention is to build a working product and then improve upon it on each iteration.

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

Retreive the current state of the game by calling `Xxo.GameServer.get_state("name")`, passing in the same name that was used to start the game. This will return a struct that includes the following:

```elixir
%Xxo.Game{
  action_on: "mia",
  board: %{
    {0, 0} => " ",
    {0, 1} => "x",
    {0, 2} => " ",
    {1, 0} => " ",
    {1, 1} => " ",
    {1, 2} => " ",
    {2, 0} => " ",
    {2, 1} => " ",
    {2, 2} => " "
  },
  finished: false,
  game_name: "mia",
  winner: nil
}
```
