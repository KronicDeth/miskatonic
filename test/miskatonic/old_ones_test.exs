defmodule Miskatonic.OldOnesTest do
  use Miskatonic.Clients.PortalCase

  alias Miskatonic.OldOnes

  describe "with awake graduate student" do
    setup :awake

    test "get/1 returns error" do
      assert {:error, :graduate_student_awake} = OldOnes.get("Yith Hunter")
    end
  end

  describe "with dreaming graduate student" do
    setup :dreaming

    test "get/1 returns information on OldOne" do
      id = "Yith Hunter"

      assert ^id = OldOnes.get(id)
    end
  end
end
