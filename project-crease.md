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
The Towers of Hanoi recurrence relation is given by $T(n) = 2T(n-1) + 1$
<center>
$$
\begin{align*}
\boldsymbol{T(n)} & = \boldsymbol{2T(n-1) + 1} \text{, and} \\
T(n-1) & = 2T((n-1)-1) + 1 \\
& = 2T(n-2) + 1 \\
\end{align*}
$$
so
$$
\begin{align*}
T(n) & = 2(2T(n-2) + 1) + 1 \\
& = 4T(n-2) + 2 + 1 \\
& \boldsymbol{= 4T(n-2) + 3} \text{, and} \\
T(n-2) & = 2T((n-2)-1) + 1 \\
& = 2T(n-3) + 1 \\
\end{align*}
$$
so
$$
\begin{align*}
T(n) & = 4(2T(n-3) + 1) + 3 \\
& = 8T(n-3) + 4 + 3 \\
& \boldsymbol{= 8T(n-3) + 7}
\end{align*}
$$  
</center>
Then guess the form of the answer. We have: 

$$
\begin{align}
& T(n) = 2T(n-1) + 1 \\
& T(n) = 4T(n-2) + 3 \\
& T(n) = 8T(n-3) + 7 \\
\end{align}$$

So we can derive a general recurrence which satisfies for any $k \in \mathbb Z^+_0$

$$T(n) = 2^{k}T(n-k) + 2^{k}-1 \\$$


[back](./)

