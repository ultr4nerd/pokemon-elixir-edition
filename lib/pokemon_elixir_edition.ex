defmodule PokemonElixirEdition do
  @moduledoc """
  Play "Pokémon: Elixir Edition" and complete your Pokédex
  """
  alias PokemonElixirEdition.Pokedex

  @spec welcome :: <<_::296>>
  @doc """
  Welcomes the user

  ## Examples

      iex> PokemonElixirEdition.welcome
      "Bienvenido a Pokémon: Elixir Edition"

  """
  def welcome() do
    "Bienvenido a Pokémon: Elixir Edition"
  end

  @spec catch_pokemon(integer()) :: :ok
  @doc """
  Catches a Pokémon, you can check it later with `check_pokedex/1`
  """
  def catch_pokemon(id) do
    GenServer.cast(Pokedex, {:catch, id})
  end

  @spec check_pokedex :: list()
  @doc """
  Returns al catched Pokémons
  """
  def check_pokedex do
    GenServer.call(Pokedex, :get)
  end

  @spec check_pokedex(integer()) :: map() | nil
  @doc """
  Catches a Pokémon
  """
  def check_pokedex(id) do
    GenServer.call(Pokedex, {:check, id})
  end

end
