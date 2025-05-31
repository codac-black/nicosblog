## Basics of R 

## 1. Variables
variables are used to hold values of different data types 

`syntax`  **name_of_variable  <- value**

```R
name <- "mike"

# print out the results

name

# Assign a value to the variables my_apples and my_oranges

my_apples <- 5

  

my_oranges <- 6

# Add these two variables together

my_fruit <- my_apples + my_oranges

  

# Create the variable my_fruit

my_fruit
```

## 2. Arithmetic with R

In its most basic form, R can be used as a simple calculator. Consider the following arithmetic operators:

- Addition: `+`
- Subtraction: `-`
- Multiplication: `*`
- Division: `/`
- Exponentiation: `^`
- Modulo: `%%`

The last two might need some explaining:

- The `^` operator raises the number to its left to the power of the number to its right: for example `3^2` is 9.
- The modulo returns the remainder of the division of the number to the left by the number on its right, for example 5 modulo 3 or `5 %% 3` is 2.

```R
# An addition

5 + 5 

  

# A subtraction

5 - 5 

  

# A multiplication

3 * 5

  

 # A division

(5 + 5) / 2 

  

# Exponentiation

2^5

  

# Modulo

28%%6
```
## 3.  Basic data types in R

R works with numerous data types. Some of the most basic types to get started are:

- Decimal values like `4.5` are called **numerics**.
- Whole numbers like `4` are called **integers**. Integers are also numerics.
- Boolean values (`TRUE` or `FALSE`) are called **logical**.
- Text (or string) values are called **characters**.

Note how the quotation marks in the editor indicate that `"some text"` is a string.

```R
# Change my_numeric to be 42

my_numeric <- 42

  

# Change my_character to be "universe"

my_character <- "universe"

  

# Change my_logical to be FALSE

my_logical <- FALSE
```

one can check the data type of a given variable by using the **class()** function 

```R
# Declare variables of different types

my_numeric <- 42

my_character <- "universe"

my_logical <- FALSE 

  

# Check class of my_numeric

class(my_numeric)

  

# Check class of my_character

  

class(my_character)

# Check class of my_logical

class(my_logical)
```
