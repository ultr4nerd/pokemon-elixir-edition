defmodule PokemonElixirEdition.Pokedex do
  @moduledoc """
  Pokedex GenServer
  """
  use GenServer
  alias PokemonElixirEdition.Bank

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  @doc false
  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  @doc false
  def init(_) do
    {:ok, Bank.recover()}
  end

  @doc false
  def handle_call({:check, number}, _from, pokedex) do
    case Map.fetch(pokedex, number) do
      {:ok, pokemon} -> {:reply, pokemon, pokedex}
      :error -> {:reply, nil, pokedex}
    end
  end

  @doc false
  def handle_call(:get, _from, pokedex) do
    {:reply, Map.values(pokedex), pokedex}
  end

  @doc false
  def handle_cast({:catch, number}, pokedex) do
    {:noreply, Map.put(pokedex, number, get_pokemon(number))}
  end

  @doc false
  def terminate(_reason, pokedex) do
    Bank.backup(pokedex)
  end

  defp get_pokemon(number) do
    url = "https://pokeapi.co/api/v2/pokemon/#{number}"
    %{body: body} = HTTPoison.get!(url)
    response_body = Jason.decode!(body)

    %{
      "id" => response_body["id"],
      "name" => String.capitalize(response_body["name"]),
      "weight" => response_body["weight"],
      "height" => response_body["height"],
      "base_experience" => response_body["base_experience"]
    }
  end
end
