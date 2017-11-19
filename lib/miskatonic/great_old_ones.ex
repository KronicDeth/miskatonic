defmodule Miskatonic.GreatOldOnes do
  def get(id) do
    with {:ok, client_pid} <- client_start_link() do
      Miskatonic.Client.show(client_pid, id)
    end
  end

  defp client_start_link do
    Miskatonic.Clients.Boat.start_link(
      latitude: -47.15,
      longitude: -126.72
    )
  end
end
