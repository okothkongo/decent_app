defmodule DecentAppTest do
  use ExUnit.Case
  doctest DecentApp

  alias DecentApp.Balance

  describe "Awesome tests" do
    test "success" do
      balance = %Balance{coins: 10}

      {new_balance, result} =
        DecentApp.call(balance, [3, "DUP", "COINS", 5, "+", "NOTHING", "POP", 7, "-", 9])

      assert new_balance.coins == 5
      assert length(result) > 1

      {new_balance, [value] = _result} = DecentApp.call(balance, [2, "DUP", "DUP", "*"])
      assert new_balance.coins == 4
      assert value == 8
    end

    test "failed" do
      assert DecentApp.call(%Balance{coins: 10}, [
               3,
               "DUP",
               "FALSE",
               5,
               "+",
               "NOTHING",
               "POP",
               7,
               "-",
               9
             ]) == -1

      assert DecentApp.call(%Balance{coins: 1}, [3, 5, 6]) == -1
      assert DecentApp.call(%Balance{coins: 10}, ["+"]) == -1
      assert DecentApp.call(%Balance{coins: 10}, ["-"]) == -1
      assert DecentApp.call(%Balance{coins: 10}, ["DUP"]) == -1
      assert DecentApp.call(%Balance{coins: 10}, ["POP"]) == -1
      assert DecentApp.call(%Balance{coins: 5}, [2, "DUP", "DUP", "*"]) == -1
      assert DecentApp.call(%Balance{coins: 10}, [2, "DUP", "*"]) == -1
      assert DecentApp.call(%Balance{coins: 10}, ["*"]) == -1
    end
  end
end
