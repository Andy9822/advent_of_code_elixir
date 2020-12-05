defmodule Day4Test do
  use ExUnit.Case

  test "Part 1" do
    File.read!("input/day4.txt")
    |> String.split("\n\n", trim: true)
    |> Enum.map(&String.replace(&1, "\n", " "))
    |> Day4.process(1)
    |> IO.inspect()
  end

  test "Part 2" do
    File.read!("input/day4.txt")
    |> String.split("\n\n", trim: true)
    |> Enum.map(&String.replace(&1, "\n", " "))
    |> Day4.process(2)
    |> IO.inspect()
  end
end
