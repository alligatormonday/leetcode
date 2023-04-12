defmodule Solution do
  alias JasonVendored.Encode
  @spec max_profit(prices :: [integer]) :: integer

  def max_profit(prices) do
    window =
      Enum.reduce(prices, %{min_price: nil, max_profit: 0}, fn x, acc ->
        if acc.min_price |> is_nil() do
          %{min_price: x, max_profit: 0}
        else
          profit = x - acc.min_price
          new_profit = new_max_profit(acc.max_profit, profit)

          if x < acc.min_price do
            %{min_price: x, max_profit: new_profit}
          else
            %{min_price: acc.min_price, max_profit: new_profit}
          end
        end
      end)

    window.max_profit
  end

  def new_max_profit(old_max, new_max) do
    if old_max > new_max do
      old_max
    else
      new_max
    end
  end
end

prices = [7, 6, 4, 3, 1]

Solution.max_profit(prices)
|> IO.inspect()
