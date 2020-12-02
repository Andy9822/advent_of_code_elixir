defmodule Day1 do
  @spec is_sum2020?([number()]) :: boolean()
  defp is_sum2020?(items) do
    Enum.sum(items) == 2020
  end

  @spec part_1([String.t()]) :: {number(), number(), number()}
  def part_1(numbers) do
    List.first(
      for x <- numbers, y <- Enum.drop(numbers, 1), is_sum2020?([x, y]), do: {x, y, x * y}
    )
  end

  @spec part_2([String.t()]) :: {number(), number(), number(), number()}
  def part_2(numbers) do
    List.first(
      for x <- numbers,
          y <- Enum.drop(numbers, 1),
          z <- Enum.drop(numbers, 2),
          is_sum2020?([x, y, z]),
          do: {x, y, z, x * y * z}
    )
  end
end
