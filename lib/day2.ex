defmodule Day2 do
  @type record_line() :: %{
          max_occurence: integer,
          min_occurence: integer,
          password: String.t(),
          required_letter: String.t()
        }

  @spec is_valid_password(record_line()) :: boolean
  def is_valid_password(%{
        "min_occurence" => min_occurence,
        "max_occurence" => max_occurence,
        "required_letter" => required_letter,
        "password" => password
      }) do
    count =
      password
      |> String.graphemes()
      |> Enum.count(&(&1 == required_letter))

    count >= min_occurence && count <= max_occurence
  end

  def is_valid_password_part2(%{
        "min_occurence" => first_char_pos,
        "max_occurence" => last_char_pos,
        "required_letter" => required_letter,
        "password" => password
      }) do
    [
      required_letter == String.at(password, first_char_pos - 1),
      required_letter == String.at(password, last_char_pos - 1)
    ]
    |> Enum.count(& &1) == 1
  end

  @spec process_line(String.t()) :: record_line()
  def process_line(line) do
    match =
      Regex.named_captures(
        ~r/(?<min_occurence>\d+)-(?<max_occurence>\d+) (?<required_letter>\w+): (?<password>\w+)/,
        line
      )

    %{
      match
      | "min_occurence" => match["min_occurence"] |> String.to_integer(),
        "max_occurence" => match["max_occurence"] |> String.to_integer()
    }
  end

  @spec count_valid_passwords_part_1([String.t()]) :: non_neg_integer
  def count_valid_passwords_part_1(lines) do
    lines
    |> Enum.map(fn line ->
      line
      |> process_line()
      |> is_valid_password()
    end)
    |> Enum.count(& &1)
  end

  @spec count_valid_passwords_part_2([String.t()]) :: non_neg_integer
  def count_valid_passwords_part_2(lines) do
    lines
    |> Enum.map(fn line ->
      line
      |> process_line()
      |> is_valid_password_part2()
    end)
    |> Enum.count(& &1)
  end
end
