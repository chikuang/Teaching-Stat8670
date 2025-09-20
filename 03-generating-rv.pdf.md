# Generating Random Variables

\newcommand{\bbeta}{\boldsymbol{\beta}}
\newcommand{\bX}{\boldsymbol{X}}
\newcommand{\bx}{\boldsymbol{x}}
\newcommand{\bZ}{\boldsymbol{Z}}
\newcommand{\bz}{\boldsymbol{z}}
\newcommand{\bv}{\boldsymbol{v}}
\newcommand{\bmu}{\boldsymbol{\mu}}
\newcommand{\R}{\mathbb R}

One of the fundamental tools required in computational statistics is the
ability to *simulate random variables* (rvs) from specified probability distributions. 

n the simplest case, to simulate drawing an observation at random from
a finite population, a method of generating rvs from the discrete uniform distribution is required. Therefore, a suitable generator of
uniform pseudo-random numbers is essential. 

Methods for generating random
variates from other probability distributions all depend on the uniform random number generator (RNG).

In the Appendices, we have seen that how to use the built-in R functions to generate RVs from some common distributions, such as `runif()`, `rnorm()`, `rbinom()`, etc. In this Section, we will go over some of the common methods to generate RVs from a costume distributions.

Example Theorem

::: {.callout-example title="Sampling from a finite population"}
If we already have a finite population of size $N$ with values $x_1, x_2, \ldots, x_N$ in hand, we can sample from this population *with* and *without* replacement.


::: {.cell}

```{.r .cell-code}
set.seed(777)
sample(c(0,1), size = 10, replace = TRUE)  # with replacement
```

::: {.cell-output .cell-output-stdout}

```
 [1] 1 0 1 1 1 1 0 1 1 1
```


:::

```{.r .cell-code}
# Lottery ticket
sample(1:999999, size = 5, replace = FALSE)
```

::: {.cell-output .cell-output-stdout}

```
[1] 567561 203418 450070 287692 435311
```


:::

```{.r .cell-code}
sample(toupper(letters))
```

::: {.cell-output .cell-output-stdout}

```
 [1] "H" "N" "J" "Y" "B" "U" "F" "P" "Z" "V" "W" "I" "L" "A" "G" "Q" "X" "D" "M"
[20] "R" "C" "T" "O" "K" "E" "S"
```


:::
:::

:::

Table: (#tab:r-distributions) Common probability distributions and their corresponding R functions for cumulative distribution function (CDF) and random number generation.

| Distribution       | cdf     | Generator | Parameters           |
|--------------------|---------|-----------|----------------------|
| beta               | pbeta   | rbeta     | shape1, shape2       |
| binomial           | pbinom  | rbinom    | size, prob           |
| chi-squared        | pchisq  | rchisq    | df                   |
| exponential        | pexp    | rexp      | rate                 |
| F                  | pf      | rf        | df1, df2             |
| gamma              | pgamma  | rgamma    | shape, rate or scale |
| geometric          | pgeom   | rgeom     | prob                 |
| lognormal          | plnorm  | rlnorm    | meanlog, sdlog       |
| negative binomial  | pnbinom | rnbinom   | size, prob           |
| normal             | pnorm   | rnorm     | mean, sd             |
| Poisson            | ppois   | rpois     | lambda               |
| Student's t        | pt      | rt        | df                   |
| uniform            | punif   | runif     | min, max             |

------------------------------------------------------------------------

Reference used:

-  Reference book [2]
