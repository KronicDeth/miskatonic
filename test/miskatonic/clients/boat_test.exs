defmodule Miskatonic.Clients.BoatTest do
  use Miskatonic.Clients.BoatCase

  alias Miskatonic.Clients.Boat

  describe "with stars misaligned" do
    setup :stars_misaligned

    test "fails to rise from the sea" do
      assert {:error, :star_alignment} = Boat.start_link(latitude: -47.15, longitude: -127.72)
    end
  end

  describe "with stars aligned" do
    setup :stars_aligned

    test "rises from the sea" do
      assert {:ok, _} = Boat.start_link(latitude: -47.15, longitude: -126.72)
    end
  end
end
