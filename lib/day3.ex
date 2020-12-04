defmodule Day3 do
  @spec process([[String.t()]], number(), number()) :: non_neg_integer()
  def process(lines, right, down) do
    line_length = lines |> Enum.at(0) |> length()

    range = for x <- 1..(length(lines) - down), x * down < length(lines), do: x

    range
    |> Enum.map(&{&1 * down, rem(&1 * right, line_length)})
    |> Enum.map(fn {first_index, second_index} ->
      lines
      |> Enum.at(first_index)
      |> Enum.at(second_index)
    end)
    |> Enum.count(&(&1 == "#"))
  end
end
