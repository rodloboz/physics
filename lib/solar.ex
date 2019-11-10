defmodule Solar do
  def power(%{classification: :C, scale: s}), do: s * 1
  def power(%{classification: :M, scale: s}), do: s * 10
  def power(%{classification: :X, scale: s}), do: s * 1000

  # def no_eva(flares) do
  #   Enum.filter(flares, fn flare -> power(flare) > 1000 end)
  # end
  def no_eva(flares), do: Enum.filter(flares, &(power(&1) > 1000))
  def deadliest(flares), do: Enum.map(flares, &power(&1)) |> Enum.max()

  # head tail recursion
  # def total_flare_power(list) do
  #   total_flare_power(list, 0)
  # end
  # def total_flare_power([], total), do: total # exit function
  # def total_flare_power([head | tail], total) do
  #   new_total = total + power(head)
  #   total_flare_power(tail, new_total)
  # end

  # Using Enum to reduce
  # def total_flare_power(list) do
  #   Enum.reduce(list, 0, fn(flare, total) -> total + power(flare) end)
  # end

  # Using a List comprehension and Enum.sum
  def total_flare_power(list) do
    (for flare <- list, do: power(flare)) |> Enum.sum
  end

end
