defmodule PokemonElixirEdition do
  @moduledoc """
  Play "Pokémon: Elixir Edition" and complete your Pokédex
  """
  alias PokemonElixirEdition.Pokedex

  @spec catch_pokemon(integer()) :: :ok
  @doc """
  Catches a Pokémon, you can check it later with `check_pokedex/1`

  ## Examples

      iex> PokemonElixirEdition.catch_pokemon(100)
      :ok

  """
  def catch_pokemon(id) do
    GenServer.cast(Pokedex, {:catch, id})
  end

  @spec check_pokedex :: list()
  @doc """
  Returns al catched Pokémons

  ## Examples

      iex> PokemonElixirEdition.check_pokedex
      []

      iex> PokemonElixirEdition.catch_pokemon(7)
      iex> PokemonElixirEdition.check_pokedex
      [
        %{
          "base_experience" => 63,
          "height" => 5,
          "id" => 7,
          "name" => "Squirtle",
          "weight" => 90
        }
      ]

  """
  def check_pokedex do
    GenServer.call(Pokedex, :get)
  end

  @spec check_pokedex(integer()) :: map() | nil
  @doc """
  Catches a Pokémon

  ## Examples

      iex> PokemonElixirEdition.check_pokedex(7)
      nil

      iex> PokemonElixirEdition.catch_pokemon(7)
      iex> PokemonElixirEdition.check_pokedex(7)
      %{
        "base_experience" => 63,
        "height" => 5,
        "id" => 7,
        "name" => "Squirtle",
        "weight" => 90
      }

  """
  def check_pokedex(id) do
    GenServer.call(Pokedex, {:check, id})
  end

end
