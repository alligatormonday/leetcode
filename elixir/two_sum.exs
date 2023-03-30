defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]

  def two_sum(nums, target) do
    find_target(nums |> Enum.with_index(), target)
  end

  def find_target(nums, target) do
    [first | tail] = nums
    results = Enum.filter(tail, fn {num, index} -> num + elem(first, 0) == target end)

    if results != [] do
      [elem(first, 1), List.first(results) |> elem(1)]
    else
      find_target(tail, target)
    end
  end
end
