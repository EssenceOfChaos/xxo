defmodule Xxo.MixProject do
  @moduledoc """
  The application entry point and dependency list.
  """
  use Mix.Project

  @version "1.1.0"

  def project do
    [
      app: :xxo,
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Xxo provides the game logic for tic-tac-toe",
      package: package(),
      ## Docs ##
      name: "Xxo",
      source_url: "https://github.com/EssenceOfChaos/xxo",
      homepage_url: "",
      # The main page in the docs
      docs: [main: "Xxo", logo: "assets/images/x-symbol.png", extras: ["README.md"]]
    ]
  end

  defp package do
    [
      name: :xxo,
      maintainers: ["Frederick John"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/EssenceOfChaos/xxo"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Xxo.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:gen_state_machine, "~> 2.0.5"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false}
    ]
  end
end
