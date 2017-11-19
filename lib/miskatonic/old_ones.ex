defmodule Miskatonic.OldOnes do
  def get(id) do
    with {:ok, client_pid} <- client_start_link() do
      Miskatonic.Client.show(client_pid, id)
    end
  end

  defp client_start_link do
    Miskatonic.Clients.Portal.start_link(entrance: "witch-house")
  end
end
