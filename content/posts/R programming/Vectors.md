---
title: "Vectors"
date: 2025-05-31T16:24:17+03:00
section: "R programming"
categories: ["R programming"]
---
---
section: "R programming"
categories: ["R programming"]
title: "Vectors"
date: 2025-05-31
---
Vectors are one-dimension arrays that can hold numeric data, character data, or logical data. In other words, a vector is a simple tool to store data.

In R vectors are created using the combine function **==c()==**.

```R
numeric_vectors <- c(1,2,3,4,5)
character_vector <- c("A","B","c")
boolean_vector <- c(TRUE, FALSE)
mixed <- c(1,2,'a','b')
```

You can give a name to the elements of a vector with theÂ ==`names()`==Â function

```R
#Â PokerÂ winningsÂ fromÂ MondayÂ toÂ Friday

poker_vectorÂ <-Â c(140,Â -50,Â 20,Â -120,Â 240)

#Â RouletteÂ winningsÂ fromÂ MondayÂ toÂ Friday

roulette_vectorÂ <-Â c(-24,Â -50,Â 100,Â -350,Â 10)

#Â AssignÂ daysÂ asÂ namesÂ ofÂ poker_vector

names(poker_vector)Â <-Â c("Monday",Â "Tuesday",Â "Wednesday",Â "Thursday",Â "Friday")
  
#Â AssignÂ daysÂ asÂ namesÂ ofÂ roulette_vector

names(roulette_vector)Â <-Â c("Monday",Â "Tuesday",Â "Wednesday",Â "Thursday",Â "Friday")

#Â TheÂ variableÂ days_vector

days_vectorÂ <-Â c("Monday",Â "Tuesday",Â "Wednesday",Â "Thursday",Â "Friday")

#Â AssignÂ theÂ namesÂ ofÂ theÂ dayÂ toÂ roulette_vectorÂ andÂ poker_vector

names(poker_vector)Â <-Â Â c(days_vector)Â 

names(roulette_vector)Â <-c(days_vector)
```

## Vector selection

To select elements of a vector (and later matrices, data frames, â€¦), you can use square brackets. Between the square brackets, you indicate what elements to select. For example, to select the first element of the vector, you typeÂ `poker_vector[1]`. To select the second element of the vector, you typeÂ `poker_vector[2]`, etc.

**Notice that the first element in a vector has index 1, not 0 as in many other programming languages.**

```R
numbers <- c(1,2,3,4,5)
two <- numbers[2]
```

To select multiple elements from a vector, you can add square brackets at the end of it. You can indicate between the brackets what elements should be selected. For example: suppose you want to select the first and the fifth numbers of the numbers: use the vectorÂ `c(1, 5)`Â between the square brackets.

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
days_of_week <- c("Monday",Â "Tuesday",Â "Wednesday",Â "Thursday",Â "Friday")

```

## Selection by comparison

The (logical) comparison operators known to R are:

- `<`Â for less than
- `>`Â for greater than
- `<=`Â for less than or equal to
- `>=`Â for greater than or equal to
- `==`Â for equal to each other
- `!=`Â not equal to each other

you can use comparison operators with vectors.

```R 
fruits <- c("Apples", "Mangoes", "Peach", "Banana", "Oranges")

orange <- fruits == "Oranges"

fruit <- fruits[orange]
fruit
```
