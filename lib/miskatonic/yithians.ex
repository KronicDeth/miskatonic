defmodule Miskatonic.Yithians do
  use Miskatonic.Species

  @impl Miskatonic.Species
  def client_start_link do
    client_start_link(yithian: "Librarian")
  end

  def client_start_link(keywords) do
    Miskatonic.Clients.Psychic.start_link(keywords)
  end

  @impl Miskatonic.Species
  def get(id) do
    case super(id) do
      {:error, :not_found} ->
        with {:ok, pid} <- client_start_link(yithian: "Coleopterous") do
          Miskatonic.Client.show(pid, id)
        end
      found ->
        found
    end
  end
end
