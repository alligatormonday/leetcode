defmodule Solution do
  @spec roman_to_int(s :: String.t()) :: integer
  def roman_to_int(s) do
    numbers =
      String.split(s, "", trim: true) |> convert_to_nums() |> Enum.reverse() |> Enum.with_index()

    Enum.reduce(numbers, 0, fn x, acc ->
      {num, index} = x
      prev = Enum.at(numbers, index - 1)

      if index > 0 do
        if num >= prev |> elem(0) do
          acc + num
        else
          acc - num
        end
      else
        num
      end
    end)
  end

  def convert_to_nums(numerals) do
    Enum.map(numerals, fn x ->
      case x do
        "I" ->
          1

        "V" ->
          5

        "X" ->
          10

        "L" ->
          50

        "C" ->
          100

        "D" ->
          500

        "M" ->
          1000

        _ ->
          nil
      end
    end)
  end
end

IO.inspect(Solution.roman_to_int("MCMXCIV"))
