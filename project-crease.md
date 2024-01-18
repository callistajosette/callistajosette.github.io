---
layout: default
---

# Solving Recurrences

<p align="center">
  1. Guess and Check
  2. Unrolling the Recurrence
  3. Recurrence Trees
</p>

## Description

A recurrence is a recursive description of a function, or in other words, a description of a function in terms of itself. Like all recursive structures, a recurrence consists of one or more base cases and one or more recursive cases. We say that a particular function satisfies a recurrence, or is the solution to a recurrence if each of the statements of a recurrence holds. Closed-form recurrence solutions are particularly valuable for bounds analysis 

## Unrolling the Recurrence
### Ex. 1 Towers of Hanoi
The Towers of Hanoi recurrence relation is given by: $T(n) = 2T(n-1) + 1$

$$\begin{align*}
T(n) & = 2T(n-1) + 1 \\
T(n-1) & = 2T((n-1)-1) + 1 \\
& = 2T((n-2) + 1 \\
\text{so}\\
T(n)= 2(2T((n-2) + 1) + 1\\
& = 4T(n-2) + 2 + 1\\
& = 4T(n-2) + 3


T(n-2) & = 2T((n-2)-1) + 1 \\
& = 2T((n-3) + 1 \\

\end{align*}$$




[back](./)

