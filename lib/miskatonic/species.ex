defmodule Miskatonic.Species do
  @callback client_start_link() ::
              {:ok, pid} | {:error, reason :: term}

  defmacro __using__([]) do
    quote do
      @behaviour Miskatonic.Species

      def get(id) do
        with {:ok, client_pid} <- client_start_link() do
          Miskatonic.Client.show(client_pid, id)
        end
      end
    end
  end
end
