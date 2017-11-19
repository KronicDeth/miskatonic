defmodule Miskatonic.Species do
  defmacro __using__([]) do
    quote do
      def get(id) do
        with {:ok, client_pid} <- client_start_link() do
          Miskatonic.Client.show(client_pid, id)
        end
      end
    end
  end
end
