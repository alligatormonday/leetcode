# Implement a first in first out (FIFO) 
# queue using only two stacks. 
# The implemented queue should support 
# all the functions of a normal queue (push, peek, pop, and empty).

defmodule Stack do
  defstruct top: nil

  def new, do: []

  def push(stack, value) do
    [value | stack]
  end

  def pop([]), do: nil

  def pop(stack) do
    [value | rest] = stack
    {value, rest}
  end

  def is_empty?(stack) do
    if stack == [], do: true, else: false
  end
end

defmodule Queue do
  stack_2 = Stack.new()

  def pop(stack) do
    Enum.reduce(stack, %{stack_1: stack, stack_2: Stack.new()}, fn x, acc ->
      IO.inspect(acc)

      if length(acc.stack_1) > 1,
        do: %{stack_1: tl(acc.stack_1), stack_2: acc.stack_2 |> Stack.push(hd(acc.stack_1))},
        else:
          {acc.stack_1,
           Enum.reduce_while(acc.stack_2, [], fn x, acc ->
             if x > 0, do: {:cont, acc + x}, else: {:halt, acc}
           end)}
    end)
  end

  def push do
  end

  def peek do
  end

  def is_empty? do
  end
end

stack_1 = Stack.new() |> Stack.push(1) |> Stack.push(2) |> Stack.push(3)
IO.inspect(stack_1 |> Queue.pop())
