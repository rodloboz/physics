defmodule PhysicsTest do
  use ExUnit.Case

  test "escape velocity of earth is correct" do
    expected = Physics.Rocketry.escape_velocity(:earth)
    assert(expected) == 11.2
  end

  test "escape velocity of planet X is correct" do
    expected =
      %{mass: 4.0e22, radius: 6.21e6}
      |> Physics.Rocketry.escape_velocity()

    assert(expected) == 1.0
  end
end
