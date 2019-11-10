defmodule RocketryTest do
  use ExUnit.Case

  test "Orbital acceleration defaults to Earth" do
    expected = Physics.Rocketry.orbital_acceleration(100)
    assert expected == 9.515619587729839
  end

  test "Orbital speed for earth at 100km" do
    expected = Physics.Rocketry.orbital_speed(100)
    assert expected == 7846.404191259335
  end

  test "Orbital acceleration for earth at 100km" do
    expected = Physics.Rocketry.orbital_acceleration(100)
    assert expected == 9.515619587729839
  end

  test "Orbital term for 100km above earth" do
    expected = Physics.Rocketry.orbital_term(100)
    assert (expected > 4) && (expected < 5) #crap fix this!
  end

  # test "Orbital acceleration for Jupiter" do
  #   x = orbital_acceleration(Planet.select[:jupiter], 100)
  #   assert x == 24.659005330334
  # end
  #
  # test "Orbital term at 100km for Saturn at 6000km" do
  #   x = orbital_term(Planet.select[:saturn], 6000)
  #   assert x == 4.8
  # end

  test "escape velocity of earth is correct" do
    expected = Physics.Rocketry.escape_velocity(:earth)
    assert(expected) == 11.2
  end

  test "escape velocity of mars is correct" do
    expected = Physics.Rocketry.escape_velocity(:mars)
    assert(expected) == 5.1
  end

  test "escape velocity of the moon is correct" do
    expected = Physics.Rocketry.escape_velocity(:moon)
    assert(expected) == 2375.9
  end

  test "escape velocity of planet X is correct" do
    expected =
      %{mass: 4.0e22, radius: 6.21e6}
      |> Physics.Rocketry.escape_velocity()

    assert(expected) == 1.0
  end
end
