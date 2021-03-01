defmodule PokemonElixirEdition.Bank do
  @moduledoc """
  Saves your Pokémons in the cloud
  """
  use GenServer

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  @doc false
  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  ### Exyernal API

  @spec backup(map()) :: :ok
  @doc """
  Backups Pokédex
  """
  def backup(pokedex) do
    GenServer.cast(__MODULE__, {:backup, pokedex})
  end

  @doc """
  Returns saved Pokédex
  """
  def recover do
    GenServer.call(__MODULE__, :recover)
  end

  ### Internal API

  @doc false
  def init(_) do
    {:ok, %{}}
  end

  @doc false
  def handle_cast({:backup, pokedex}, _current) do
    {:noreply, pokedex}
  end

  @doc false
  def handle_call(:recover, _from, pokedex) do
    {:reply, pokedex, pokedex}
  end
end
