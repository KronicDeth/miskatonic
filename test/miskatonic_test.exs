defmodule MiskatonicTest do
  use ExUnit.Case
  doctest Miskatonic

  test "greets the world" do
    assert Miskatonic.hello() == :world
  end
end
