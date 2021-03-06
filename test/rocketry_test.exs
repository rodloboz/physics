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

  test "Orbital acceleration for Jupiter" do
    result = Physics.Rocketry.orbital_acceleration(Planet.select()[:jupiter], 100)
    assert result == 24.659005330334
  end

  test "Orbital term at 100km for Saturn at 6000km" do
    result = Physics.Rocketry.orbital_term(Planet.select()[:saturn], 6000)
    assert result == 4.8
  end
end
