defmodule PokemonElixirEdition.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {PokemonElixirEdition.Bank, nil},
      {PokemonElixirEdition.Pokedex, nil},
    ]

    opts = [strategy: :one_for_one, name: PokemonElixirEdition.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
