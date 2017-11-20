defmodule Miskatonic.Yithians do
  use Miskatonic.Species

  def client_start_link(keywords \\ [yithian: "Librarian"]) do
    Miskatonic.Clients.Psychic.start_link(keywords)
  end

  def get(id) do
    case Miskatonic.Species.get(__MODULE__, id) do
      {:error, :not_found} ->
        with {:ok, pid} <- client_start_link(yithian: "Coleopterous") do
          Miskatonic.Client.show(pid, id)
        end
      found ->
        found
    end
  end
end
