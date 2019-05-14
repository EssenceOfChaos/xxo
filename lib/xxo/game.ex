defmodule Xxo.Game do
  @moduledoc """
  The Game module is responsible for starting/stopping new games.
  """
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts)
  end


  def init(opts \\ %{}) do
    {:ok, opts}
  end

end
