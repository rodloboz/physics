defmodule Physics.Rocketry do
  alias Physics.Converter, as: Converter
  alias Physics.Laws, as: Laws

  @earth Planet.select()[:earth]

  def orbital_acceleration(height), do: orbital_acceleration(@earth, height)

  def orbital_acceleration(planet, height) do
    (orbital_speed(planet, height) |> Calcs.squared()) / orbital_radius(planet, height)
  end

  def orbital_term(height), do: orbital_term(@earth, height)

  def orbital_term(planet, height) do
    (4 * (:math.pi() |> Calcs.squared()) * (orbital_radius(planet, height) |> Calcs.cubed()) /
       (Laws.newtons_gravitational_constant() * planet.mass))
    |> Calcs.square_root()
    |> Converter.seconds_to_hours()
  end

  def orbital_speed(height), do: orbital_speed(@earth, height)

  def orbital_speed(planet, height) do
    (Laws.newtons_gravitational_constant() * planet.mass / orbital_radius(planet, height))
    |> Calcs.square_root()
  end

  defp orbital_radius(planet, height) do
    planet.radius + (height |> Converter.to_meters())
  end
end
