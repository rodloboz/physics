defmodule ConverterTest do
  use ExUnit.Case

  test "rounds to nearest tenth" do
    result = Physics.Converter.to_nearest_tenth(7.8984)
    assert result == 7.9
  end

  test "converts meters to km" do
    result = Physics.Converter.to_km(8500)
    assert result == 8.5
  end

  test "converts km to meters" do
    result = Physics.Converter.to_meters(8.5)
    assert result == 8500
  end
end
