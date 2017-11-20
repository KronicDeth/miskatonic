defmodule Miskatonic.YithiansTest do
  use Miskatonic.Clients.PsychicCase

  alias Miskatonic.Yithians

  describe "with alive yithian" do
    setup :alive

    test "get/1 returns information on Yithian" do
      id = "Yith Hunter"
      assert ^id = Yithians.get(id)
    end
  end

  describe "with yithian killed by flying polyps" do
    setup :killed

    test "get/1 returns error" do
      assert {:error, :killed_by_flying_polyps} = Yithians.get("Librarian")
    end
  end
end
