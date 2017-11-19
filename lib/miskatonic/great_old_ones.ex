defmodule Miskatonic.GreatOldOnes do
  use Miskatonic.Species

  defp client_start_link do
    Miskatonic.Clients.Boat.start_link(
      latitude: -47.15,
      longitude: -126.72
    )
  end
end
