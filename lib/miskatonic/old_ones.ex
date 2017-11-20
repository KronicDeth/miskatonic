defmodule Miskatonic.OldOnes do
  use Miskatonic.Species

  @impl Miskatonic.Species
  def client_start_link do
    Miskatonic.Clients.Portal.start_link(entrance: "witch-house")
  end
end
