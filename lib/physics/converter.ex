defmodule Physics.Converter do
  def to_nearest_tenth(value) do
    Float.ceil(value, 1)
  end

  def to_km(value) do
    value / 1000
  end

  def to_light_seconds({:miles, miles}) do
    (miles * 5.36819e-6) |> round_down
  end

  def to_light_seconds({:meters, meters}) do
    (meters * 3.335638620368e-9) |> round_down
  end

  def round_down(value) when is_float(value), do: trunc(value)
end
