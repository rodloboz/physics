defmodule CalcsTest do
  use ExUnit.Case

  test "cubing" do
    expected = 3 |> Calcs.cubed
    assert expected == 27
  end

  test "squaring" do
    expected = 5654987423 |> Calcs.squared
    assert expected == 31978882754288180929
  end

  test "square root" do
    expected = 66445577 |> Calcs.square_root
    assert expected == 8151.415643923453
  end
end
