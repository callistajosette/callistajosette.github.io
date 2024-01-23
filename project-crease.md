---
layout: default
---

# Solving Recurrences

<p align="center">
  1. Unrolling the Recurrence
  2. Recurrence Trees
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
    <label class="accordion-header" for="1-1">+ Let's prove by induction that this holds for all $k \in \mathbb Z^+_0$</label>
    <div class="accordion-content">
      <p>
      We will prove by induction P(n): unrolling the Hanoi recurrence, $T(n) = 2T(n-1) + 1$, k times yields $T(n) = 2^{k}T(n-k) + 2^{k}-1$ for all $k \in \mathbb Z^+_0$<br><br> 
      <u>Basis:</u> We will show $P(k=0)$ holds<br>
      $P(k=0)$ trivially holds; since we have unrolled the recurrence 0 times, we do not enter the generator<br>
      $\rightarrow$ So we have shown that P(n) holds for $k=0$.<br><br>
      <u>Inductive Step:</u> We will show $P(k \geq 0)$ holds<br> 
      Inductive Hypothesis:
      Assume $P(k-1) \rightarrow$ $T(n)=2^{k-1}T(n-(k-1))+2^{k-1}-1$<br><br>
      Wts. $P((k-1)+1): P(k) \rightarrow$ $T(n)=2^{k}T(n-k)+2^{k}-1$<br><br>
      We have:<br>
      $T(n)=2^{k-1}T(n-(k-1))+2^{k-1}-1$<br><br>
      Then by defn. of unrolling we derive from $P(k-1)$...<br>
      $T(n)=2^{k-1}(2T(n-k)+1)+2^{k-1}-1$, <br>
      $T(n)=2^{k}(T(n-k)+1)+2^{k-1}-1$<br>
      $T(n)=2^{k}(T(n-k))+2^{k-1}$<br>
      $\rightarrow$So we have shown that P(n) holds for $k\geq 0$<br><br>
      So we have shown that P(n) holds for all $k \in \mathbb Z^+_0$.
      $$\tag*{$\blacksquare$}$$
      </p>
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

### Ex. 2 Another Recurrence
Consider the recurrence relation given by $T(1) = 1$, $T(n) = 2T(n/2) + n^{2}$
<center>
$$
\begin{align*}
\boldsymbol{T(n)} & = \boldsymbol{2T(n/2) + n^{2}} \text{, and} \\
T(n/2) & = 2T((n/2)/2) + (n/2)^{2} \\
& = 2T(n/2*1/2) + (n/2)^{2} \\
& = 2T(n/2^{2}) + (n/2)^{2} \\
\end{align*}
$$
so
$$
\begin{align*}
T(n) & = 2(2T(n/2^{2})+(n/2)^{2}) + n^{2} \\
& = 2^{2}T(n/2^{2})+2(n/2)^{2} + n^{2} \\
& \boldsymbol{= 2^{2}T(n/2^{2})+(n/2)^{2} + n^{2}} \text{, and} \\
T(n/2^{2}) & = 2T((n/2^{2})/2) + (n/2^{2})^{2} \\
& = 2T((n/2^{3})) + (n/2^{2})^{2} \\
\end{align*}
$$
so
$$
\begin{align*}
T(n) & = 2^{2}(2T(n/2^{3})+(n/2)^{2})+ (n^{2}/2) + n^{2} \\
& = 2^{3}T(n/2^{3})+(n^{2}/2^{2})+ (n^{2}/2) + n^{2} \\
& \boldsymbol{= 8T(n-3) + 7}
\end{align*}
$$  
</center>

## Credits
These notes were compiled from various freely accessible online sources, most notably course handouts provided to students at the University of Washington, and the 
Recurrences University of Illinois Urbana-Champaign.

[back](./)

