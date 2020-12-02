defmodule Day2Test do
  use ExUnit.Case

  test "Day 2" do
    lines =
      File.read!("input/day2.txt")
      |> String.split("\n", trim: true)

    IO.puts("\nDAY 2")
    IO.puts("PART 1")
    IO.inspect(Day2.count_valid_passwords_part_1(lines))
    IO.puts("\n")
    IO.puts("PART 2")
    IO.inspect(Day2.count_valid_passwords_part_2(lines))
    IO.puts("\n")
  end
end
