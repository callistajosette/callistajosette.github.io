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
The Towers of Hanoi recurrence relation is given by $T(1) = 1$, $T(n) = 2T(n-1) + 1$
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

So it looks like unrolling the initial Hanoi recurrence k times for $k \in \mathbb Z^+_0$, will give us a new recurrence

$$T(n) = 2^{k}T(n-k) + 2^{k}-1 \\$$

<div class="accordion" id="accordion1">
  <div class="accordion-item">
    <input type="checkbox" class="accordion-input" id="1-1">
    <label class="accordion-header" for="1-1">+ Let's prove that our derived general recurrence is equivalent to $2T(n-1) + 1$</label>
    <div class="accordion-content">
      <p>Proof by Induction
      We will prove by induction that</p>
    </div>
  </div>
</div>

Then as we continue to unroll the recurrence, unrolling the recurrence say $k \rightarrow n$ times...

$$
\begin{align*}
T(n) & = 2^{n}T(n-n) + 2^{n}-1 \\
& = 2^{n}T(0) + 2^{n}-1 \\
& = 0 + 2^{n}-1 \\
& = 2^{n}-1 \\
\end{align*}
$$

We derive a closed form solution to the recurrence relation.

<div class="accordion" id="accordion2">
  <div class="accordion-item">
    <input type="checkbox" class="accordion-input" id="2-1">
    <label class="accordion-header" for="2-1">+ Let's prove by induction that our derived closed form solution is equivalent to the general recurrence we found earlier</label>
    <div class="accordion-content">
      <p>Proof by Induction
      We will prove by induction that the derived closed form solution $T(n)=2^{n}-1$ satisfies the recurrence relation $T(n)= 2^{k}T(n-k)+2^{k}-1$.
      Basis
      base case: n=0, 1
      0: trivial case, 0 discs requires 0 moves to solve
      1: T(1)=2^{1}</p>
    </div>
  </div>
</div>


[back](./)

