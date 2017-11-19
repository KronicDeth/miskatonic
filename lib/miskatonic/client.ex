defmodule Miskatonic.Client do
  use GenServer

  # Functions

  def show(pid, id) do
    GenServer.call(pid, {:show, id})
  end

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  ## GenServer callback modules

  @impl GenServer
  def handle_call({:show, id}, _from, state) do
    {:reply, id, state}
  end
end
