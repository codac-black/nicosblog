---
title: "Intro To R Programming"
date: 2025-05-31T16:24:17+03:00
section: "R programming"
categories: ["R programming"]
---
---
section: "R programming"
categories: ["R programming"]
title: "Intro To R Programming"
date: 2025-05-31
---
## Basics of R 

## 1. Variables
variables are used to hold values of different data types 

`syntax`  **name_of_variable  <- value**

```r
name <- "mike"

# print out the results

name

#Â AssignÂ aÂ valueÂ toÂ theÂ variablesÂ my_applesÂ andÂ my_oranges

my_applesÂ <-Â 5

  

my_orangesÂ <-Â 6

#Â AddÂ theseÂ twoÂ variablesÂ together

my_fruitÂ <-Â my_applesÂ +Â my_oranges

  

#Â CreateÂ theÂ variableÂ my_fruit

my_fruit
```

## 2. Arithmetic with R

In its most basic form, R can be used as a simple calculator. Consider the following arithmetic operators:

- Addition:Â `+`
- Subtraction:Â `-`
- Multiplication:Â `*`
- Division:Â `/`
- Exponentiation:Â `^`
- Modulo:Â `%%`

The last two might need some explaining:

- TheÂ `^`Â operator raises the number to its left to the power of the number to its right: for exampleÂ `3^2`Â is 9.
- The modulo returns the remainder of the division of the number to the left by the number on its right, for example 5 modulo 3 orÂ `5 %% 3`Â is 2.

```r
#Â AnÂ addition

5Â +Â 5Â  

#Â A subtraction

5Â -Â 5Â 

#Â AÂ multiplication

3Â *Â 5

#Â AÂ division

(5Â +Â 5)Â /Â 2Â 

#Â Exponentiation

2^5

#Â Modulo

28%%6
```
## 3.  Basic data types in R

R works with numerous data types. Some of the most basic types to get started are:

- Decimal values likeÂ `4.5`Â are calledÂ **numerics**.
- Whole numbers likeÂ `4`Â are calledÂ **integers**. Integers are also numerics.
- Boolean values (`TRUE`Â orÂ `FALSE`) are calledÂ **logical**.
- Text (or string) values are calledÂ **characters**.

Note how the quotation marks in the editor indicate thatÂ `"some text"`Â is a string.

```r
#Â ChangeÂ my_numericÂ toÂ beÂ 42

my_numericÂ <-Â 42

#Â ChangeÂ my_characterÂ toÂ beÂ "universe"

my_characterÂ <-Â "universe"

#Â ChangeÂ my_logicalÂ toÂ beÂ FALSE

my_logicalÂ <-Â FALSE
```

one can check the data type of a given variable by using the **class()** function 

```r
#Â DeclareÂ variablesÂ ofÂ differentÂ types

my_numericÂ <-Â 42

my_characterÂ <-Â "universe"

my_logicalÂ <-Â FALSEÂ 

#Â CheckÂ classÂ ofÂ my_numeric

class(my_numeric)

#Â CheckÂ classÂ ofÂ my_character

class(my_character)

#Â CheckÂ classÂ ofÂ my_logical
class(my_logical)
```
