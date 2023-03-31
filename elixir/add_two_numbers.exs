defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule Solution do
  @spec add_two_numbers(l1 :: ListNode.t() | nil, l2 :: ListNode.t() | nil) :: ListNode.t() | nil

  def add_two_numbers(l1, l2) do
    l1 = build_list(l1) |> Enum.join("") |> String.to_integer()
    l2 = build_list(l2) |> Enum.join("") |> String.to_integer()
    res = (l1 + l2) |> Integer.to_string() |> String.split("", trim: true)
    build_node(res)
  end

  def build_list(node, list \\ []) do
    list = [node.val] ++ list

    if node.next != nil do
      build_list(node.next, list)
    else
      list
    end
  end

  def build_node([]) do
    nil
  end

  def build_node(list, node \\ %{}) do
    {first, rest} = List.pop_at(list, -1)
    %ListNode{val: String.to_integer(first), next: build_node(rest)}
  end
end

defmodule Main do
  Solution.add_two_numbers(
    %ListNode{next: %ListNode{next: %ListNode{next: nil, val: 3}, val: 4}, val: 2},
    %ListNode{next: %ListNode{next: %ListNode{next: nil, val: 4}, val: 6}, val: 5}
  )
  |> IO.inspect()
end

Main
