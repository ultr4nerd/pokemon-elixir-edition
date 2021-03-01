defmodule PokemonElixirEdition.MixProject do
  use Mix.Project

  def project do
    [
      app: :pokemon_elixir_edition,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Pokemón: Elixir Edition"
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {PokemonElixirEdition.Application, []}
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.7"},
      {:jason, "~> 1.2"},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
    ]
  end
end
