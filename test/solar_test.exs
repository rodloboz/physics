defmodule SolarTest do
  use ExUnit.Case

  setup do
    flares = [
      %{classification: :X, scale: 10, scale: 99, date: Date.from_erl({1859, 8, 29})},
      %{classification: :M, scale: 10, scale: 5.8, date: Date.from_erl({2015, 1, 12})},
      %{classification: :M, scale: 6, scale: 1.2, date: Date.from_erl({2015, 2, 9})},
      %{classification: :C, scale: 6, scale: 3.2, date: Date.from_erl({2015, 4, 18})},
      %{classification: :M, scale: 7, scale: 83.6, date: Date.from_erl({2015, 6, 23})},
      %{classification: :C, scale: 10, scale: 2.5, date: Date.from_erl({2015, 7, 4})},
      %{classification: :X, scale: 2, scale: 72, date: Date.from_erl({2012, 7, 23})},
      %{classification: :X, scale: 4, scale: 45, date: Date.from_erl({2003, 11, 4})}
    ]

    {:ok, data: flares}
  end

  test "We have 8 solar flares", %{data: flares} do
    assert length(flares) == 8
  end

  test "Warns about dangerous flares", %{data: flares} do
    expected = [
      %{classification: :X, date: {:ok, ~D[1859-08-29]}, scale: 99},
      %{classification: :X, date: {:ok, ~D[2012-07-23]}, scale: 72},
      %{classification: :X, date: {:ok, ~D[2003-11-04]}, scale: 45}
    ]

    assert Solar.no_eva(flares) == expected
  end

  test "Deadliest", %{data: flares} do
    assert Solar.deadliest(flares) == 99000
  end

  test "Sums up the total flare power", %{data: flares} do
    assert Solar.total_flare_power(flares) == 216911.7
  end
end
