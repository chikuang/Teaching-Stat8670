# Data Structure and R Programming

Data types, operators, variables

Two basic types of objects: (1) data & (2) functions

-   Data: can be a number, a vector, a matrix, a dataframe, a list or other datatypes

-   Function: a function is a set of instructions that takes input, processes it, and returns output. Functions can be built-in or user-defined.

## Data type

-   Boolean/Logical: Yes or No, Head or Tail, True or False

-   Integers: Whole numbers $\mathbb{Z}$, e.g., 1, 2, 3, -1, -2, -3

-   Characters: Text strings, e.g., "Hello", "World."

-   Floats: Noninteger fractional numbers, e.g., $\pi$, $e$.

-   Missing data: `NA` in R, which stands for "Not Available." It is used to represent missing or undefined values in a dataset.


::: {.cell}

```{.r .cell-code}
day <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
weather <- c("Raining", "Sunny", NA, "Windy", "Snowing")
data.frame(rbind(day, weather))
```

::: {.cell-output .cell-output-stdout}

```
             X1      X2        X3       X4      X5
day      Monday Tuesday Wednesday Thursday  Friday
weather Raining   Sunny      <NA>    Windy Snowing
```


:::
:::


-   Other more complex types

### To change data type

You may change the data type using the following functions, but the chance is that some of the information will be missing. Do this with caution!


::: {.cell}

```{.r .cell-code}
x <- pi
print(x)
```

::: {.cell-output .cell-output-stdout}

```
[1] 3.141593
```


:::

```{.r .cell-code}
x_int <- as.integer(x)
print(x_int)
```

::: {.cell-output .cell-output-stdout}

```
[1] 3
```


:::
:::


Some of the conversion functions:

-   `as.integer()`: Convert to integer.
-   `as.numeric()`: Convert to numeric (float).
-   `as.character()`: Convert to character.
-   `as.logical()`: Convert to logical (boolean).
-   `as.Date()`: Convert to date.
-   `as.factor()`: Convert to factor (categorical variable).
-   `as.list()`: Convert to list.
-   `as.matrix()`: Convert to matrix.
-   `as.data.frame()`: Convert to data frame.
-   `as.vector()`: Convert to vector.
-   `as.complex()`: Convert to complex number.

## Operators

-   Unary: With only **one** argument. E.g., `-x` (negation), `!x` (logical negation).

-   Binary: With **two** arguments. E.g., `x + y` (addition), `x - y` (subtraction), `x * y` (multiplication), `x / y` (division).

### Comparison Operator

Comparing two objects. E.g., `x == y` (equal), `x != y` (not equal), `x < y` (less than), `x > y` (greater than), `x <= y` (less than or equal to), `x >= y` (greater than or equal to).

### Logical Operator

Logical operators are used to combine or manipulate logical values (TRUE or FALSE). E.g., `x & y` (logical AND), `x | y` (logical OR), `!x` (logical NOT).

We shall note that the logical operators in R are vectorized, `x | y` and `x || y` are different. The former is vectorized, while the latter is not.

``` r
x <- c(TRUE, FALSE, FALSE)
y <- c(TRUE, FALSE, FALSE)
x | y  # [1]  TRUE FALSE FALSE
x || y # This will return an error
```

## Indexing

Indexing is a way to access or modify specific elements in a data structure. In **R**, indexing can be done using square brackets `[]` for vectors and matrices, or the `$` operator for data frames. Note that the index starts from **0** in **R**, which is different from some other programming languages like Python.

## Naming

In **R**, you can assign names to objects using the `names()` function. This is useful for making your code more readable and for accessing specific elements in a data structure.

A good practice is to use `_` (underscore) to separate words in variable names, e.g., `my_variable`. This makes the code more readable and easier to understand.


::: {.cell}

```{.r .cell-code}
# Assign names to a vector
temp <- c(20, 30, 27, 31, 45)
names(temp) <- c("Mon", "Tues", "Wed", "Thurs", "Fri")
print(temp)
```

::: {.cell-output .cell-output-stdout}

```
  Mon  Tues   Wed Thurs   Fri 
   20    30    27    31    45 
```


:::
:::


``` r
rownames(temp) <- "Day1" # error
```


::: {.cell}

```{.r .cell-code}
temp_mat <- matrix(c(20, 30, 27, 31, 45), nrow = 1, ncol = 5)
colnames(temp_mat) <- c("Mon", "Tues", "Wed", "Thurs", "Fri")
rownames(temp_mat) <- "Day1" # error
print(temp_mat)
```

::: {.cell-output .cell-output-stdout}

```
     Mon Tues Wed Thurs Fri
Day1  20   30  27    31  45
```


:::
:::


## Array and Matrix

One may define an array or a matrix in **R** using the `array()` or `matrix()` functions, respectively. An array is a multi-dimensional data structure, while a matrix is a two-dimensional array.


::: {.cell}

```{.r .cell-code}
# Create a 1-dimensional array
array_1d <- array(1:10, dim = 10)
array_1d
```

::: {.cell-output .cell-output-stdout}

```
 [1]  1  2  3  4  5  6  7  8  9 10
```


:::

```{.r .cell-code}
# Create a 2-dimensional array
array_2d <- array(1:12, dim = c(4, 3))
array_2d
```

::: {.cell-output .cell-output-stdout}

```
     [,1] [,2] [,3]
[1,]    1    5    9
[2,]    2    6   10
[3,]    3    7   11
[4,]    4    8   12
```


:::

```{.r .cell-code}
# Create a 3-dimensional array
array_3d <- array(1:24, dim = c(4, 3, 2))
array_3d
```

::: {.cell-output .cell-output-stdout}

```
, , 1

     [,1] [,2] [,3]
[1,]    1    5    9
[2,]    2    6   10
[3,]    3    7   11
[4,]    4    8   12

, , 2

     [,1] [,2] [,3]
[1,]   13   17   21
[2,]   14   18   22
[3,]   15   19   23
[4,]   16   20   24
```


:::

```{.r .cell-code}
# Create a matrix
my_matrix <- matrix(1:12, nrow = 4, ncol = 3)
my_matrix
```

::: {.cell-output .cell-output-stdout}

```
     [,1] [,2] [,3]
[1,]    1    5    9
[2,]    2    6   10
[3,]    3    7   11
[4,]    4    8   12
```


:::
:::


Note here, the matrix is a special case of an array, where the number of dimensions is exactly 2.

``` r
is.matrix(array_2d)   # TRUE
is.matrix(my_matrix)  # TRUE

is.array(array_2d)    # TRUE
is.array(my_matrix)   # TRUE
```

## Key and Value Pair

Key-Value Pair is a data structure that consists of a key and its corresponding value. In **R**, this can be implemented using named vectors, lists, or data frames. Usually, the most commonly used case is in the lists and data frames. The values can be extra by providing the corresonding key


::: {.cell}

```{.r .cell-code}
key1 <- "Tues"
value1 <- 32
key2 <- "Wed"
value2 <- 28

list_temp <- list()
list_temp[[ key1 ]] <- value1
list_temp[[ key2 ]] <- value2

print(list_temp)
```

::: {.cell-output .cell-output-stdout}

```
$Tues
[1] 32

$Wed
[1] 28
```


:::

```{.r .cell-code}
## Now providing a key - Tues
### First way
list_temp[["Tues"]]
```

::: {.cell-output .cell-output-stdout}

```
[1] 32
```


:::

```{.r .cell-code}
### Second way
list_temp$Tues
```

::: {.cell-output .cell-output-stdout}

```
[1] 32
```


:::
:::


## Data Frame

Dataframe is a two-dimensional, tabular data structure in R that can hold different types of variables (numeric, character, factor, etc.) in each column. It is similar to a spreadsheet or SQL table.


::: {.cell}

```{.r .cell-code}
iris <- datasets::iris
head(iris)
```

::: {.cell-output .cell-output-stdout}

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```


:::
:::


## Apply function

The `apply()` function is the basic model of the family of apply functions in R, which includes specific functions like `lapply()`, `sapply()`, `tapply()`, `mapply()`, `vapply()`, `rapply()`, `bapply()`, `eapply()`, and others. These functions are used to apply a function to elements of a data structure (like a vector, list, or data frame) in a (sometimes) more efficient and concise way than using loops.


::: {.cell}

```{.r .cell-code}
x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
dimnames(x)[[1]] <- letters[1:8]
print(x)
```

::: {.cell-output .cell-output-stdout}

```
  x1 x2
a  3  4
b  3  3
c  3  2
d  3  1
e  3  2
f  3  3
g  3  4
h  3  5
```


:::

```{.r .cell-code}
apply(x, MARGIN = 2, mean) #apply the mean function to their "columns"
```

::: {.cell-output .cell-output-stdout}

```
x1 x2 
 3  3 
```


:::

```{.r .cell-code}
col.sums <- apply(x, MARGIN = 2, sum) #apply the sum function to their "columns"
row.sums <- apply(x, MARGIN = 1, sum) #apply the sum function to their "rows"
rbind(cbind(x, Rtot = row.sums), Ctot = c(col.sums, sum(col.sums)))
```

::: {.cell-output .cell-output-stdout}

```
     x1 x2 Rtot
a     3  4    7
b     3  3    6
c     3  2    5
d     3  1    4
e     3  2    5
f     3  3    6
g     3  4    7
h     3  5    8
Ctot 24 24   48
```


:::
:::


Some of the commonly used apply functions:

-   **lapply**: Apply a Function over a List or Vector

-   **sapply**: a user-friendly version and wrapper of lapply by default returning a vector, matrix

-   **vapply**: similar to sapply, but has a pre-specified type of return value, so it can be safer (and sometimes faster) to use.

## Tidyverse

The tidyverse is a collection of open source packages for the R programming language introduced by Hadley Wickham and his team that "share an underlying design philosophy, grammar, and data structures" of tidy data. Characteristic features of tidyverse packages include extensive use of non-standard evaluation and encouraging piping.


::: {.cell}

```{.r .cell-code}
## Load all tidyverse packages
library(tidyverse)
```

::: {.cell-output .cell-output-stderr}

```
-- Attaching core tidyverse packages ------------------------ tidyverse 2.0.0 --
v dplyr     1.1.4     v readr     2.1.5
v forcats   1.0.0     v stringr   1.5.2
v ggplot2   4.0.0     v tibble    3.3.0
v lubridate 1.9.4     v tidyr     1.3.1
v purrr     1.1.0     
-- Conflicts ------------------------------------------ tidyverse_conflicts() --
x dplyr::filter() masks stats::filter()
x dplyr::lag()    masks stats::lag()
i Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```


:::

```{.r .cell-code}
## Or load specific packages in the tidy family
library(dplyr) # Data manipulation
library(ggplot2) # Data visualization
library(readr) # Data import
library(tibble) # Tidy data frames
library(tidyr) # Data tidying
# ...
```
:::


## Pipe

Pipe operator `|>` (native after R version 4.0) or `%>$` (from magrittr package) is a powerful tool in **R** that allows you to chain together multiple operations in a clear and concise way. It takes the output of one function and passes it as the first argument to the next function.

For example, we can write


::: {.cell}

```{.r .cell-code}
set.seed(777)
x <- rnorm(5)

## Without using pipe
print(round(mean(x), 2))
```

::: {.cell-output .cell-output-stdout}

```
[1] 0.37
```


:::

```{.r .cell-code}
## Using pipe
x |> 
  mean() |> # applying the mean function
  round(2) |> #round to 2nd decimal place
  print()
```

::: {.cell-output .cell-output-stdout}

```
[1] 0.37
```


:::
:::


We can see that, without using the pipe, if we are applying multiple functions to the same object, we may have hard time to track. This can make the code less readable and harder to maintain. On the other hand, using pipe, we can clearly see the sequence of operations being applied to the data, making it easier to understand and modify.

### Some rules

`|>` should **always have a space before it** and should typically **be the last thing on a line**. This simplifies adding new steps, reorganizing existing ones, and modifying elements within each step.

Note that all of the packages in the tidyverse family support the pipe operator (except `ggplot2`!), so you can use it with any of them.

## Questions in class

### Lecture 1, August 25, 2025

Q1. If I know Python already, why learn R?

Reply: My general take are 1). R is more specialized for statistical analysis and data visualization, while Python is a more general-purpose programming language. 2). R has a rich ecosystem of packages and libraries specifically designed for statistical computing, making it a popular choice among statisticians and data scientists. 3). R's syntax and data structures are often more intuitive for statistical tasks, which can lead to faster development and easier collaboration with other statisticians. 4). Also, the tidyverse ecosystem including *ggplot* and others are a big plus when dealing with big dataframes. 5). They are not meant to replace each other, but work as a complement.

Q2. Why my installation of R sometimes failed on a Windows machine?

Reply: There are many reasons. One of the most common reasons is that you may need to manually add the path to the environment variable.

### Lecture 2, August 27, 2025

Q1. What's the difference of using `apply` v.s. `looping` in R?

Reply: The apply functions are often faster and more efficient than looping, especially for large datasets, because they have done some vectorization under the hood. Also, it has much higher readibility and better conciseness. However, depends on the task, you may want to do the **benchmarking** to see the performance difference.

Q2. How to use `pipe` with two or more variables?

Reply: There are several ways to do this.

1.  Within the tidyverse family: One way is to use the `dplyr` package, which provides a set of functions that work well with the pipe operator. For example, you can use the `mutate()` function to create a new variable based on two existing variables. For example, you can do


::: {.cell}

```{.r .cell-code}
library(dplyr)
library(magrittr)  # for %$%
library(purrr)     # for pmap / exec if needed

my_df <- tibble(x = 1:5, y = 6:10)
f  <- function(a, b) a + 2*b

my_df %>%
  mutate(z = f(x, y))
```

::: {.cell-output .cell-output-stdout}

```
# A tibble: 5 x 3
      x     y     z
  <int> <int> <dbl>
1     1     6    13
2     2     7    16
3     3     8    19
4     4     9    22
5     5    10    25
```


:::
:::


2.  Using base R, you may do something like the following through the `magrittr` package’s exposition pipe `%$%`:


::: {.cell}

```{.r .cell-code}
library(magrittr)
# method 1
my_df %$% f(x, y) 
```

::: {.cell-output .cell-output-stdout}

```
[1] 13 16 19 22 25
```


:::

```{.r .cell-code}
# or use . as a placeholder
# method 2
my_df %>% { f(.$x, .$y) }
```

::: {.cell-output .cell-output-stdout}

```
[1] 13 16 19 22 25
```


:::
:::


------------------------------------------------------------------------

Some of the materials are adapted from [CMU Stat36-350](https://www.stat.cmu.edu/~ryantibs/statcomp/).

A comprehensive reference for all the *tidyverse* tools is [R for Data Science](https://r4ds.had.co.nz/).

A comprehensive reference for *ggplot2* is [ggplot2: Elegant Graphics for Data Analysis](https://ggplot2-book.org/).
