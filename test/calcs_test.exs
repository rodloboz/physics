defmodule CalcsTest do
  use ExUnit.Case

  test "cubing" do
    result = 3 |> Calcs.cubed()
    assert result == 27
  end

  test "squaring" do
    result = 5_654_987_423 |> Calcs.squared()
    assert result == 31_978_882_754_288_180_929
  end

  test "square root" do
    result = 66_445_577 |> Calcs.square_root()
    assert result == 8151.415643923453
  end
end
