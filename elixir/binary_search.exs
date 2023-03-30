defmodule BinarySearch do
  def search([{x, y}], target) do
    if x == target, do: y, else: -1
  end

  def search(nums, target) do
    middle_index = (length(nums) / 2) |> ceil()

    {first_half, second_half} =
      nums
      |> Enum.with_index(fn x, index ->
        case x do
          {x, y} -> {x, y}
          _ -> {x, index}
        end
      end)
      |> Enum.split(middle_index)

    {value, index} = first_half |> List.last({:none, 0})
    IO.inspect(first_half)

    case value do
      :none -> -1
      x when x > target -> search(first_half, target)
      x when x < target -> search(second_half, target)
      x when x == target -> index
    end
  end
end

nums = [-1, 0, 3, 5, 9, 12]

target = 2

BinarySearch.search(nums, target)
|> IO.inspect()
