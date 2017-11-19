defmodule Miskatonic.Clients.Portal do
  defstruct [:entrance]

  # Functions

  @spec start_link([entrance: String.t]) :: {:ok, pid} | {:error, :graduage_student_awake}
  def start_link(keywords) do
    if dreaming() do
      Miskatonic.Client.start_link(%__MODULE__{entrance: Keyword.fetch!(keywords, :entrance)})
    else
      {:error, :graduate_student_awake}
    end
  end

  ## Private Functions

  defp dreaming do
    Application.get_env(:miskatonic, __MODULE__)[:dreaming]
  end
end
