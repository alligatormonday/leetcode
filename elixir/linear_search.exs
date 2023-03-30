# given an array of integers; nums, which is sorted in ascending order, and an integer; target, write a function to search; target in sums. If target exists, return the target. Otherwise, return -1.

defmodule LinearSearch do
  def search(nums, target) do
    # exit when target is found, otherwise return -1
    [head | tail] =
      Enum.with_index(nums, fn num, index ->
        case num do
          {x, y} -> {x, y}
          _ -> {num, index}
        end
      end)

    {value, index} = head

    cond do
      value == target ->
        index

      tail == [] ->
        -1

      true ->
        search(tail, target)
    end
  end
end

nums = [-1, 0, 3, 5, 9, 12]

target = 9

# target = 8

LinearSearch.search(nums, target) |> IO.inspect()
