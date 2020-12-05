defmodule Day4 do
  def is_valid(
        %{
          "byr" => _,
          "iyr" => _,
          "eyr" => _,
          "hgt" => _,
          "hcl" => _,
          "ecl" => _,
          "pid" => _
        },
        1
      ),
      do: true

  def is_valid(
        %{
          "byr" => byr,
          "iyr" => iyr,
          "eyr" => eyr,
          "hgt" => hgt,
          "hcl" => hcl,
          "ecl" => ecl,
          "pid" => pid
        },
        2
      ) do
    is_valid_byr?(byr) &&
      is_valid_iyr?(iyr) &&
      is_valid_eyr?(eyr) &&
      is_valid_hgt?(hgt) &&
      is_valid_hcl?(hcl) &&
      is_valid_ecl?(ecl) &&
      is_valid_pid?(pid)
  end

  def is_valid(_, _), do: false

  @spec is_within_range(number(), number(), number()) :: boolean
  defp is_within_range(year, min, max) do
    year >= min && year <= max
  end

  # byr (Birth Year) - four digits; at least 1920 and at most 2002.
  def is_valid_byr?(year), do: is_within_range(String.to_integer(year), 1920, 2002)
  # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
  def is_valid_iyr?(year), do: is_within_range(String.to_integer(year), 2010, 2020)
  # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
  def is_valid_eyr?(year), do: is_within_range(String.to_integer(year), 2020, 2030)
  # hgt (Height) - a number followed by either cm or in:
  # If cm, the number must be at least 150 and at most 193.
  # If in, the number must be at least 59 and at most 76.
  def is_valid_hgt?(input) do
    re = ~r/^(\d+)(cm|in)$/

    with [digit_str, unit] <- Regex.run(re, input, capture: :all_but_first) do
      digit = String.to_integer(digit_str)

      case unit do
        "cm" -> is_within_range(digit, 150, 193)
        "in" -> is_within_range(digit, 59, 76)
        _ -> false
      end
    end
  end

  # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
  def is_valid_ecl?(ecl), do: ecl in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
  # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
  def is_valid_hcl?(hcl), do: String.match?(hcl, ~r/^#[a-fA-F0-9]{6}$/)
  # pid (Passport ID) - a nine-digit number, including leading zeroes.
  def is_valid_pid?(pid), do: String.match?(pid, ~r/^[0-9]{9}$/)

  def process(lines, part) do
    lines
    |> Enum.map(fn line ->
      line
      |> String.split(" ", trim: true)
      |> Enum.map(&(String.split(&1, ":") |> List.to_tuple()))
      |> Enum.into(%{})
      |> is_valid(part)
    end)
    |> Enum.count(& &1)
  end
end
