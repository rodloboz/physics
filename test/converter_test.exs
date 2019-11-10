defmodule ConverterTest do
  use ExUnit.Case

  test "rounds to nearest tenth" do
    expected = Physics.Converter.to_nearest_tenth(7.8984)
    assert expected == 7.9
  end

  test "converts meters to km" do
    expected = Physics.Converter.to_km(8500)
    assert expected == 8.5
  end

  test "converts km to meters" do
    expected = Physics.Converter.to_meters(8.5)
    assert expected == 8500
  end
end
