defmodule Miskatonic.Clients.PortalCase do
  use ExUnit.CaseTemplate

  alias Miskatonic.Clients.Portal

  using do
    quote do
      import Miskatonic.Clients.PortalCase
    end
  end

  setup do
    dreaming = Application.get_env(:miskatonic, Portal)[:dreaming]

    on_exit fn -> put_env_dreaming(dreaming) end
  end

  def awake(_), do: put_env_dreaming(false)
  def dreaming(_), do: put_env_dreaming(true)

  def put_env_dreaming(dreaming) do
    Application.put_env(:miskatonic, Portal, dreaming: dreaming)

    :ok
  end
end
