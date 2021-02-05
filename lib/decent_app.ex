defmodule DecentApp do
  alias DecentApp.Balance

  def call(%Balance{} = balance, commands) do
    {balance, result, error} =
      Enum.reduce(commands, {balance, [], false}, fn command, {bal, res, error} ->
        if error or operation_not_valid?(command, res) do
          {nil, nil, true}
        else
          {new_balance(bal, command), result(command, res), false}
        end
      end)

    if error do
      -1
    else
      if balance.coins < 0 do
        -1
      else
        {balance, result}
      end
    end
  end

  defp operation_not_valid?(command, res) when length(res) < 2 and command in ["+", "-"], do: true

  defp operation_not_valid?(command, res)
       when length(res) < 1 and command in ["DUP", "POP"],
       do: true

  defp operation_not_valid?(command, _res)
       when command in ["DUP", "POP", "+", "-", "COINS", "NOTHING"],
       do: false

  defp operation_not_valid?(command, _res) when is_integer(command) and command in 0..9, do: false

  defp operation_not_valid?(_command, _res), do: true

  defp result(command, res) when command in ["NOTHING", "COINS"], do: res

  defp result(command, res) when command in ["+", "-"] do
    [first, second | rest] = Enum.reverse(res)
    Enum.reverse(rest) ++ [first - second]
  end

  defp result("DUP", res), do: res ++ [List.last(res)]

  defp result("POP", res) do
    {_, res} = List.pop_at(res, length(res) - 1)
    res
  end

  defp result(command, res), do: res ++ [command]

  defp new_balance(bal, "+"), do: %{bal | coins: bal.coins - 2}
  defp new_balance(bal, "COINS"), do: %{bal | coins: bal.coins + 5}
  defp new_balance(bal, _command), do: %{bal | coins: bal.coins - 1}
end
