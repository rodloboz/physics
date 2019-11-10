defmodule Physics.Rocketry do
  require IEx
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

  def orbital_speed(height) do
    Laws.newtons_gravitational_constant * Planets.earth.mass / orbital_radius(height)
    |> Calcs.square_root
  end

  def orbital_acceleration(height) do
    (orbital_speed(height) |> Calcs.squared) / orbital_radius(height)
  end

  def orbital_term(height) do
    4 * (:math.pi |> Calcs.squared) * (orbital_radius(height) |> Calcs.cubed) /
    (Laws.newtons_gravitational_constant * Planets.earth.mass)
    |> Calcs.square_root
    |> Converter.seconds_to_hours
  end

  defp orbital_radius(height) do
    Planets.earth.radius + (height |> Converter.to_meters)
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    (2 * Laws.newtons_gravitational_constant * mass / radius)
    |> Calcs.square_root
  end
end
