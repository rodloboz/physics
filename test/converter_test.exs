defmodule ConverterTest do
  use ExUnit.Case

  test "rounds to nearest tenth" do
    expected = Physics.Converter.to_nearest_tenth(7.8984)
    assert(expected) == 7.8
  end

  test "converts meters to km" do
    expected = Physics.Converter.to_km(8500)
    assert(expected) == 8.5
  end
end
