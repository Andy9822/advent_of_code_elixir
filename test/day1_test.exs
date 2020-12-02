defmodule Day1Test do
  use ExUnit.Case

  test "Day 1" do
    contents =
      File.read!("input/day1.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)

    IO.inspect(contents |> Day1.part_1)
    IO.inspect(contents |> Day1.part_2)
  end
end
