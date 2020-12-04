defmodule Day3Test do
  use ExUnit.Case

  test "Part 1" do
    File.read!("input/day3.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(&String.graphemes/1)
    |> Day3.process(3, 1)
    |> IO.inspect()
  end

  test "Part 2" do
    contents =
      File.read!("input/day3.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.graphemes/1)

    [
      {1, 1},
      {3, 1},
      {5, 1},
      {7, 1},
      {1, 2}
    ]
    |> Enum.map(fn {x, y} -> Day3.process(contents, x, y) end)
    |> Enum.reduce(fn x, acc -> x * acc end)
    |> IO.inspect()
  end
end
