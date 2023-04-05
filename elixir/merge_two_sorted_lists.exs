defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule Solution do
  @spec merge_two_lists(list1 :: ListNode.t() | nil, list2 :: ListNode.t() | nil) ::
          ListNode.t() | nil
  def merge_two_lists(list1, list2) do
    list1 = build_list(list1)
    list2 = build_list(list2)
    list = list1 ++ list2
    quick_sort(list)
    build_node(list)
  end

  def quick_sort([]), do: []

  def quick_sort([pivot | tail]) do
    left = for x <- tail, x < pivot, do: x
    right = for x <- tail, x >= pivot, do: x
    quick_sort(left) ++ [pivot] ++ quick_sort(right)
  end

  def build_list(nil), do: []

  def build_list(node, list) when node.next == nil do
    [node.val | list]
  end

  def build_list(node, list \\ []) do
    list = [node.val | list]
    build_list(node.next, list)
  end

  def build_node([]) do
    nil
  end

  def build_node(list, node \\ %{}) do
    {first, rest} = List.pop_at(list, 0)
    %ListNode{val: first, next: build_node(rest)}
  end
end

defmodule Main do
  test_one = %ListNode{
    val: 1,
    next: %ListNode{val: 2, next: %ListNode{val: 4, next: nil}}
  }

  test_two = %ListNode{
    val: 1,
    next: %ListNode{val: 3, next: %ListNode{val: 4, next: nil}}
  }

  Solution.merge_two_lists(test_one, test_two)
  |> IO.inspect()
end

Main
