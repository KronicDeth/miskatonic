defmodule Miskatonic.Species do
  @callback client_start_link() ::
              {:ok, pid} | {:error, reason :: term}

  @callback get(id :: String.t) :: term

  defmacro __using__([]) do
    quote do
      @behaviour Miskatonic.Species

      @impl Miskatonic.Species
      def get(id), do: Miskatonic.Species.get(__MODULE__, id)

      defoverridable Miskatonic.Species
    end
  end

  def get(module, id) do
    with {:ok, client_pid} <- module.client_start_link() do
      Miskatonic.Client.show(client_pid, id)
    end
  end
end
