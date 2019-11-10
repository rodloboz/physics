defmodule Physics.Converter do
  def to_light_seconds({:miles, miles} = value, precision: precision)
      when is_integer(miles) or is_float(miles) do
    (miles * 5.36819e-6) |> round_to(precision)
  end

  def to_light_seconds({:meters, meters} = value, precision: precision)
      when is_integer(meters) or is_float(meters) do
    (meters * 3.335638620368e-9) |> round_to(precision)
  end

  def to_light_seconds({:feet, feet} = value, precision: precision)
      when is_integer(feet) or is_float(feet) do
    (feet * 1.016702651488166404e-9) |> round_to(precision)
  end

  def to_light_seconds({:inches, inches} = value, precision: precision)
      when is_integer(inches) or is_float(inches) do
    (inches * 8.472522095734715723e-11) |> round_to(precision)
  end

  def round_to(value, precision) when is_float(value) do
    Float.round(value, precision)
  end

  def to_nearest_tenth(value) when is_integer(value) or is_float(value) do
    round_to(value, 1)
  end

  def to_km(value) when is_integer(value) or is_float(value) do
    value / 1000
  end

  def to_meters(value) when is_integer(value) or is_float(value) do
    value * 1000
  end

  def seconds_to_hours(value) when is_integer(value) or is_float(value) do
    (value / 3600) |> to_nearest_tenth
  end
end
