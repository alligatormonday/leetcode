# measures execution time
defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc()
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end

defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule Solution do
  @spec is_palindrome(head :: ListNode.t() | nil) :: boolean
  def is_palindrome(head) do
    nodes = build_list(head)
    is_same?(nodes)
  end

  def is_same?(nodes) do
    reversed_list = Enum.reverse(nodes)
    if reversed_list == nodes, do: true, else: false
  end

  def build_list(node, list) when node.next == nil do
    [node.val | list]
  end

  def build_list(node, list \\ []) do
    list = [node.val | list]
    build_list(node.next, list)
  end
end

# tooling for CLI to test solution
defmodule Main do
  test_one = %ListNode{
    val: 1,
    next: %ListNode{val: 2, next: nil}
  }

  Solution.is_palindrome(test_one)
  |> IO.inspect()
end

Main
