defmodule Miskatonic.Clients.PsychicCase do
  use ExUnit.CaseTemplate

  alias Miskatonic.Clients.Psychic

  using do
    quote do
      import Miskatonic.Clients.PsychicCase
    end
  end

  setup do
    killed_by_flying_polyps = Application.get_env(:miskatonic, Psychic)[:killed_by_flying_polyps]

    on_exit fn -> put_env_killed_by_flying_polyps(killed_by_flying_polyps) end
  end

  def alive(_), do: put_env_killed_by_flying_polyps(false)
  def killed(_), do: put_env_killed_by_flying_polyps(true)

  def put_env_killed_by_flying_polyps(killed_by_flying_polyps) do
    Application.put_env(:miskatonic, Psychic, killed_by_flying_polyps: killed_by_flying_polyps)

    :ok
  end
end
