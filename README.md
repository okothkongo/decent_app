# Decent App

Our system provides functionality to handle various commands and returns
the list of integers. 
Your exercise is to add the new command to our system.

Introduction:

- The system takes the balance and the list of commands
- The system returns the list of integers (result list)
- All commands represent String or Integer
- "DUP" duplicates the last item in the result list
- "POP" cuts the last item in the result list
- "+" adds up two last items in the result list and replaces them with the
  result of addition
- "-" subtracts the second last number from the last and replaces them
  with the result of the difference
```
#e.g.
[1, 4, 5] -> [1, 1]
```
- "COINS" does nothing, but adds 5 coins in balance
- "NOTHING" does nothing
- <any_number> Any positive number less than 10, adds this number into 
  resulted list. e.g. 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
- Each command costs 1 coin. But there are exceptions (look below)
- Actually "COINS" costs nothing
- Actually "+" is expensive command and costs 2

We have recently received request from our business to add new command "*".
This command costs 3 coins
This command takes 3 last items from the list, multiply them and replaces 
them with the result
```
# e.g.
[1, 2, 3, 5] -> [1, 30]
[1, 1, 2, 2] -> [1, 4]
```

There are exceptions. In a case of exception, the system returns `-1`:
- If a command requires a number of items in the list, but the list does
  not have them, we trigger exception
```
# e.g.
the list = [1]
When we use command "+", we expect 2 items in the list. Result should be `-1`
```
- If we send unsupported command, we also trigger exception `-1`
- If we don't have enough coins, we also trigger exception `-1`

## Instructions

Consider this an exercise in refactoring a legacy system to make your
feature easier to implement, and leave things in a more maintainable
state than you found them in. It will be even better if you can implement declarative
approach and after it adding new commands will be through some config

To complete the exercise, perform a gradual, step by step
refactoring, showing your work with micro commits at each step.

You'll need to initialize a new git repository to start:

```
git init
git add -A
git commit -m "Initial commit"
```

You can either push new repo to github or bundle it and send `.bundle` file
