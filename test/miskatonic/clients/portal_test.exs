defmodule Miskatonic.Clients.PortalTest do
  use Miskatonic.Clients.PortalCase

  alias Miskatonic.Clients.Portal

  describe "with awake graduate student" do
    setup :awake

    test "fails to open" do
      assert {:error, :graduate_student_awake} = Portal.start_link(entrance: "withc-house")
    end
  end

  describe "with dreaming graduate student" do
    setup :dreaming

    test "opens" do
      assert {:ok, _} = Portal.start_link(entrance: "witch-house")
    end
  end
end
