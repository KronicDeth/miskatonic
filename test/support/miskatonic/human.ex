defmodule Miskatonic.Human do
  @behaviour Miskatonic.Species

  def client_start_link(), do: {:ok, self()}

  def get(id) do
    send self(), {:get, id}

    receive do
      {:got, ^id, info} -> info
    end
  end
end
