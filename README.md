# xxo

[![CircleCI](https://circleci.com/gh/EssenceOfChaos/xxo.svg?style=svg)](https://circleci.com/gh/EssenceOfChaos/xxo)

A tic-tac-toe game engine written in Elixir.

This is an MVP. My intention is to build a working product and then improve upon it on each iteration.

## Version 1

The first version will consist of a single player mode.

## Version 2

The second version of the game will add a two-player mode. Users will gain the ability to play against a choosen or random opponent.

## Version 3

The third version of the game will include an option for choosing the difficulty level of the computer. A single player will choose between `easy`, `average`, and `hard` modes.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `xxo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:xxo, "~> 1.0.0"}
  ]
end
```

The Documentation can be found at [https://hexdocs.pm/xxo](https://hexdocs.pm/xxo).

---

`Xxo` is a game engine for tic-tac-toe. While it is possible to play the game entirely from the command line the recommended method of play is using [xxo_ui](https://github.com/EssenceOfChaos/xxo_ui), a [Phoenix](https://phoenixframework.org/) application that provides a user-friendly front-end.

## After Installation

Start a new game by calling `Xxo.new_game("name")`, where "name" is the name of the player initiating the game. This call will return `{:ok, pid}`, where `pid` is the process id of the game. You can verify the game has started successfully by calling `Xxo.GameSupervisor.children()`, which will return the details of the current games under supervision.

Retrieve the current state of the game by calling `Xxo.GameServer.get_state("name")`, passing in the same name that was used to start the game. This will return a struct that includes the following:

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

Here is an example game played with version 1:

```elixir
iex(4)> Xxo.new_game("mia")

16:18:54.214 [info]  Process created... Game name: mia
{:ok, #PID<0.209.0>}
iex(5)> GameServer.player_move("mia", "x", {0, 0})

16:19:15.130 [info]  Player x has made a move. Check game status
{:ok,
 %Xxo.Game{
   action_on: "computer",
   board: %{
     {0, 0} => "x",
     {0, 1} => " ",
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
 }}
iex(6)> GameServer.computer_move("mia", "o")

16:23:18.698 [info]  Player o has made a move. Check game status
{:ok,
 %Xxo.Game{
   action_on: "computer",
   board: %{
     {0, 0} => "x",
     {0, 1} => "o",
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
 }}
iex(7)> GameServer.player_move("mia", "x", {1, 1})

16:25:11.176 [info]  Player x has made a move. Check game status
{:ok,
 %Xxo.Game{
   action_on: "computer",
   board: %{
     {0, 0} => "x",
     {0, 1} => "o",
     {0, 2} => " ",
     {1, 0} => " ",
     {1, 1} => "x",
     {1, 2} => " ",
     {2, 0} => " ",
     {2, 1} => " ",
     {2, 2} => " "
   },
   finished: false,
   game_name: "mia",
   winner: nil
 }}
iex(8)> GameServer.computer_move(mia, "o")
** (CompileError) iex:8: undefined function mia/0
    (stdlib) lists.erl:1354: :lists.mapfoldl/3
iex(8)> GameServer.computer_move("mia", "o")

16:25:59.249 [info]  Player o has made a move. Check game status
{:ok,
 %Xxo.Game{
   action_on: "computer",
   board: %{
     {0, 0} => "x",
     {0, 1} => "o",
     {0, 2} => "o",
     {1, 0} => " ",
     {1, 1} => "x",
     {1, 2} => " ",
     {2, 0} => " ",
     {2, 1} => " ",
     {2, 2} => " "
   },
   finished: false,
   game_name: "mia",
   winner: nil
 }}
iex(9)> GameServer.player_move("mia", "x", {2, 2})

16:28:06.770 [info]  Player x has made a move. Check game status
{:game_over, "x won"}
```
