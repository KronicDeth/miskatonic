defmodule Miskatonic.Clients.Boat do
  defstruct [:latitude, :longitude]

  # Functions

  @spec start_link([latitude: float, longitude: float]) :: {:ok, pid} | {:error, :star_alignment}
  def start_link(keywords) do
    if stars_aligned?() do
      Miskatonic.Client.start_link(%__MODULE__{latitude: Keyword.fetch!(keywords, :latitude),
                                               longitude: Keyword.fetch!(keywords, :longitude)})
    else
      {:error, :star_alignment}
    end
  end

  ## Private Functions

  defp stars_aligned? do
    Application.get_env(:miskatonic, __MODULE__)[:stars_aligned]
  end
end
