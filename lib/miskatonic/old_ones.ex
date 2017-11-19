defmodule Miskatonic.OldOnes do
  use Miskatonic.Species

  defp client_start_link do
    Miskatonic.Clients.Portal.start_link(entrance: "witch-house")
  end
end
