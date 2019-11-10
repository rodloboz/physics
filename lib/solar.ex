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
  def total_flare_power(flares) do
    for(flare <- flares, do: power(flare)) |> Enum.sum()
  end

  # List comprehension with Filter
  # def flare_list(flares) do
  #   for flare <- flares, flare.classification == :X do
  #     power = power(flare)
  #     %{power: power, is_deadly: power > 1000}
  #   end
  # end

  # Same as above
  def flare_list(flares) do
    # Comprehension generators must return enumerables
    for flare <- flares,
        power <- [power(flare)],
        is_deadly <- [power > 1000],
        flare.classification == :X,
        do: %{power: power, is_deadly: is_deadly}
  end
end
