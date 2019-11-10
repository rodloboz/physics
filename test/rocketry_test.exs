defmodule RocketryTest do
  use ExUnit.Case

  test "Orbital acceleration defaults to Earth" do
    result = Physics.Rocketry.orbital_acceleration(100)
    assert result == 9.515619587729839
  end

  test "Orbital speed for earth at 100km" do
    result = Physics.Rocketry.orbital_speed(100)
    assert result == 7846.404191259335
  end

  test "Orbital acceleration for earth at 100km" do
    result = Physics.Rocketry.orbital_acceleration(100)
    assert result == 9.515619587729839
  end

  test "Orbital term for 100km above earth" do
    result = Physics.Rocketry.orbital_term(100)
    # crap fix this!
    assert result > 4 && result < 5
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
    result = Physics.Rocketry.escape_velocity(:earth)
    assert(result) == 11.2
  end

  test "escape velocity of mars is correct" do
    result = Physics.Rocketry.escape_velocity(:mars)
    assert(result) == 5.1
  end

  test "escape velocity of the moon is correct" do
    result = Physics.Rocketry.escape_velocity(:moon)
    assert(result) == 2375.9
  end

  test "escape velocity of planet X is correct" do
    result =
      %{mass: 4.0e22, radius: 6.21e6}
      |> Physics.Rocketry.escape_velocity()

    assert(result) == 1.0
  end
end
