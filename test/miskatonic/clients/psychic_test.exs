defmodule Miskatonic.Clients.PsychicTest do
  use Miskatonic.Clients.PsychicCase

  alias Miskatonic.Clients.Psychic

  describe "with alive" do
    setup :alive

    test "transfers minds" do
      assert {:ok, _} = Psychic.start_link(yithian: "Librarian")
    end
  end

  describe "with killed by flying polyps" do
    setup :killed

    test "fails to transfer minds" do
      assert {:error, :killed_by_flying_polyps} = Psychic.start_link(yithian: "Librarian")
    end
  end
end
