defmodule Miskatonic.Yithians do
  use Miskatonic.Species

  def client_start_link do
    Miskatonic.Clients.Psychic.start_link(
      yithian: "Librarian"
    )
  end
end
