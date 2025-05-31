Vectors are one-dimension arrays that can hold numeric data, character data, or logical data. In other words, a vector is a simple tool to store data.

In R vectors are created using the combine function **==c()==**.

```R
numeric_vectors <- c(1,2,3,4,5)
character_vector <- c("A","B","c")
boolean_vector <- c(TRUE, FALSE)
mixed <- c(1,2,'a','b')
```

You can give a name to the elements of a vector with the ==`names()`== function

```R
# Poker winnings from Monday to Friday

poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday

roulette_vector <- c(-24, -50, 100, -350, 10)

# Assign days as names of poker_vector

names(poker_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
  
# Assign days as names of roulette_vector

names(roulette_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# The variable days_vector

days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Assign the names of the day to roulette_vector and poker_vector

names(poker_vector) <-  c(days_vector) 

names(roulette_vector) <-c(days_vector)
```

## Vector selection

To select elements of a vector (and later matrices, data frames, …), you can use square brackets. Between the square brackets, you indicate what elements to select. For example, to select the first element of the vector, you type `poker_vector[1]`. To select the second element of the vector, you type `poker_vector[2]`, etc.

**Notice that the first element in a vector has index 1, not 0 as in many other programming languages.**

```R
numbers <- c(1,2,3,4,5)
two <- numbers[2]
```

To select multiple elements from a vector, you can add square brackets at the end of it. You can indicate between the brackets what elements should be selected. For example: suppose you want to select the first and the fifth numbers of the numbers: use the vector `c(1, 5)` between the square brackets.

```R
numbers <- c(1,2,3,4,5)
one_five <- numbers[c(1, 5)]
```

## Slicing vectors
you can select numbers from a given starting point to the end point

```R
numbers <- c(1,2,3,4,5,6)
new_no <- numbers[2:5]
```

The same goes to strings and characters

```R
days_of_week <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

```

## Selection by comparison

The (logical) comparison operators known to R are:

- `<` for less than
- `>` for greater than
- `<=` for less than or equal to
- `>=` for greater than or equal to
- `==` for equal to each other
- `!=` not equal to each other

you can use comparison operators with vectors.

```R 
fruits <- c("Apples", "Mangoes", "Peach", "Banana", "Oranges")

orange <- fruits == "Oranges"

fruit <- fruits[orange]
fruit
```
