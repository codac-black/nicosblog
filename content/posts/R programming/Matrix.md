# What's a matrix?

In R, a matrix is a collection of elements of the same data type (numeric, character, or logical) arranged into a fixed number of rows and columns. 
Since you are only working with rows and columns, a matrix is called two-dimensional.

You can construct a matrix in R with the ==`matrix()`== function.

```R
matrix(1:9 ,byrow=TRUE ,nrow=3)
```

In the `matrix()` function:

- The first argument is the collection of elements that R will arrange into the rows and columns of the matrix. Here, we use `1:9` which is a shortcut for ==`c(1, 2, 3, 4, 5, 6, 7, 8, 9)`==.
- The argument `byrow` indicates that the matrix is filled by the rows. If we want the matrix to be filled by the columns, we just place `byrow = FALSE`.
- The third argument `nrow` indicates that the matrix should have three rows.


one can combine multiple vectors into a single matrix.

```R
# Box office Star Wars (in millions!)

new_hope <- c(460.998, 314.4)

empire_strikes <- c(290.475, 247.900)

return_jedi <- c(309.306, 165.8)

# Create box_office

box_office <- c(new_hope, empire_strikes,return_jedi)

# Construct star_wars_matrix

star_wars_matrix <- matrix(box_office, byrow=TRUE, nrow=3)

star_wars_matrix
```


## Naming a matrix

Similar to vectors, you can add names for the rows and the columns of a matrix by using the ==rownames()== and ==colnames()== functions

```R
# Box office Star Wars (in millions!)

new_hope <- c(460.998, 314.4)

empire_strikes <- c(290.475, 247.900)

return_jedi <- c(309.306, 165.8)

# Construct matrix

star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi), nrow = 3, byrow = TRUE)

# Vectors region and titles, used for naming

region <- c("US", "non-US")

titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Name the columns with region

colnames(star_wars_matrix) <- region

# Name the rows with titles

rownames(star_wars_matrix) <- titles

# Print out star_wars_matrix

star_wars_matrix
```

