defmodule Solution do
  @spec search_insert(nums :: [integer], target :: integer) :: integer
  def search_insert(nums, target) do
    IO.inspect(nums)
    nums = Enum.with_index(nums)
    split_list = Enum.split(nums, floor(length(nums) / 2))
    IO.inspect(split_list)
    {left, right} = split_list
    [{value, index} | _] = right
    IO.inspect(left)
    IO.inspect(right)

    result =
      case value do
        value when value == target ->
          index

        value when value < target ->
          search_insert(right, target)
      end

    IO.puts(result)

    # # case value do
    #   x when x == target ->
    #     index

    #   x when x < target ->
    #     search_insert(right, target)

    #   x when x > target ->
    #     search_insert(left, target)
    # end
  end
end

nums = [1, 3, 5, 6]
target = 3

Solution.search_insert(nums, target)
|> IO.inspect()
