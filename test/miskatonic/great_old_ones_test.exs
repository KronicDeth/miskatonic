defmodule Miskatonic.GreatOldOnesTest do
  use Miskatonic.Clients.BoatCase

  alias Miskatonic.GreatOldOnes

  describe "with stars misaligned" do
    setup :stars_misaligned

    test "get/1 returns error" do
      assert {:error, :star_alignment} = GreatOldOnes.get("Cthulhu")
    end
  end

  describe "with stars aligned" do
    setup :stars_aligned

    test "get/1 returns information on Great Old One" do
      id = "Cthulhu"

      assert ^id = GreatOldOnes.get(id)
    end
  end
end
