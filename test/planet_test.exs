defmodule PlanetTest do
  use ExUnit.Case

  setup do
    planets = [
      %{name: "Mercury", type: :rocky, ev: 4.3},
      %{name: "Venus", type: :rocky, ev: 10.4},
      %{name: "Earth", type: :rocky, ev: 11.2},
      %{name: "Mars", type: :rocky, ev: 5.0},
      %{name: "Jupiter", type: :gaseous, ev: 59.5},
      %{name: "Saturn", type: :gaseous, ev: 35.5},
      %{name: "Uranus", type: :gaseous, ev: 21.3},
      %{name: "Neptune", type: :gaseous, ev: 23.5}
    ]

    {:ok, planets: planets}
  end

  test "escape velocity of earth is correct" do
    ev = Planet.escape_velocity()
    assert ev == 11.2
  end

  test "escape velocity of mars is correct" do
    ev = Planet.escape_velocity(Planet.select()[:mars])
    assert ev == 5.0
  end
end
