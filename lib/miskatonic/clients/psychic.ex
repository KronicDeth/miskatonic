defmodule Miskatonic.Clients.Psychic do
  defstruct [:yithian]

  # Functions

  @spec start_link([yithian: String.t]) :: {:ok, pid} | {:error, :killed_by_flying_polyps}
  def start_link(keywords) do
    if killed_by_flying_polyps?() do
      {:error, :killed_by_flying_polyps}
    else
      Miskatonic.Client.start_link(%__MODULE__{yithian: Keyword.fetch(keywords, :yithian)})
    end
  end

  ## Private Functions

  defp killed_by_flying_polyps? do
    Application.get_env(:miskatonic, __MODULE__)[:killed_by_flying_polyps]
  end
end
