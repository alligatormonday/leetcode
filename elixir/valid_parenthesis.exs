defmodule Solution do
  @spec is_valid(s :: String.t()) :: boolean
  def is_valid(s) do
    res =
      String.split(s, "", trim: true)
      |> Enum.reduce([], fn x, acc ->
        case x do
          "{" -> ["{" | acc]
          "(" -> ["(" | acc]
          "[" -> ["[" | acc]
          "}" -> if List.first(acc) == "{", do: tl(acc), else: [:err]
          ")" -> if List.first(acc) == "(", do: tl(acc), else: [:err]
          "]" -> if List.first(acc) == "[", do: tl(acc), else: [:err]
        end
      end)

    if res == [], do: true, else: false
  end
end

Solution.is_valid("{()}")
|> IO.inspect()
