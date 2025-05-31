---
title: "Matrix"
date: 2025-05-31T16:24:17+03:00
section: "R programming"
categories: ["R programming"]
---
---
section: "R programming"
categories: ["R programming"]
title: "Matrix"
date: 2025-05-31
---
# What's a matrix?

In R, a matrix is a collection of elements of the same data type (numeric, character, or logical) arranged into a fixed number of rows and columns. 
Since you are only working with rows and columns, a matrix is called two-dimensional.

You can construct a matrix in R with theÂ ==`matrix()`==Â function.

```R
matrix(1:9Â ,byrow=TRUEÂ ,nrow=3)
```

In theÂ `matrix()`Â function:

- The first argument is the collection of elements that R will arrange into the rows and columns of the matrix. Here, we useÂ `1:9`Â which is a shortcut forÂ ==`c(1, 2, 3, 4, 5, 6, 7, 8, 9)`==.
- The argumentÂ `byrow`Â indicates that the matrix is filled by the rows. If we want the matrix to be filled by the columns, we just placeÂ `byrow = FALSE`.
- The third argumentÂ `nrow`Â indicates that the matrix should have three rows.


one can combine multiple vectors into a single matrix.

```R
#Â BoxÂ officeÂ StarÂ WarsÂ (inÂ millions!)

new_hopeÂ <-Â c(460.998,Â 314.4)

empire_strikesÂ <-Â c(290.475,Â 247.900)

return_jediÂ <-Â c(309.306,Â 165.8)

#Â CreateÂ box_office

box_officeÂ <-Â c(new_hope,Â empire_strikes,return_jedi)

#Â ConstructÂ star_wars_matrix

star_wars_matrixÂ <-Â matrix(box_office,Â byrow=TRUE,Â nrow=3)

star_wars_matrix
```


## Naming a matrix

Similar to vectors, you can add names for the rows and the columns of a matrix by using the ==rownames()== and ==colnames()== functions

```R
#Â BoxÂ officeÂ StarÂ WarsÂ (inÂ millions!)

new_hopeÂ <-Â c(460.998,Â 314.4)

empire_strikesÂ <-Â c(290.475,Â 247.900)

return_jediÂ <-Â c(309.306,Â 165.8)

#Â ConstructÂ matrix

star_wars_matrixÂ <-Â matrix(c(new_hope,Â empire_strikes,Â return_jedi),Â nrowÂ =Â 3,Â byrowÂ =Â TRUE)

#Â VectorsÂ regionÂ andÂ titles,Â usedÂ forÂ naming

regionÂ <-Â c("US",Â "non-US")

titlesÂ <-Â c("AÂ NewÂ Hope",Â "TheÂ EmpireÂ StrikesÂ Back",Â "ReturnÂ ofÂ theÂ Jedi")

#Â NameÂ theÂ columnsÂ withÂ region

colnames(star_wars_matrix)Â <-Â region

#Â NameÂ theÂ rowsÂ withÂ titles

rownames(star_wars_matrix)Â <-Â titles

#Â PrintÂ outÂ star_wars_matrix

star_wars_matrix
```

