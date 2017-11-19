defmodule Miskatonic.Clients.BoatCase do
  use ExUnit.CaseTemplate

  alias Miskatonic.Clients.Boat

  using do
    quote do
      import Miskatonic.Clients.BoatCase
    end
  end

  setup do
    stars_aligned = Application.get_env(:miskatonic, Boat)[:stars_aligned]

    on_exit fn -> put_env_stars_aligned(stars_aligned) end
  end

  def stars_aligned(_), do: put_env_stars_aligned(true)
  def stars_misaligned(_), do: put_env_stars_aligned(false)

  def put_env_stars_aligned(stars_aligned) do
    Application.put_env(:miskatonic, Boat, stars_aligned: stars_aligned)

    :ok
  end
end
