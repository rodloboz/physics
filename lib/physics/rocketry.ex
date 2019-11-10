defmodule Physics.Rocketry do
  alias Physics.Converter, as: Converter
  alias Physics.Laws, as: Laws

  def escape_velocity(:earth), do: Planets.earth |> escape_velocity
  def escape_velocity(:mars), do: Planets.mars |> escape_velocity
  def escape_velocity(:moon), do: Planets.moon |> escape_velocity

  def escape_velocity(planet) when is_map(planet) do
    planet
    |> calculate_escape
    |> Converter.to_km()
    |> Converter.to_nearest_tenth()
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    (2 * Laws.newtons_gravitational_constant * mass / radius)
    |> Calcs.square_root
  end
end
