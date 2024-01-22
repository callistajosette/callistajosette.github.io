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

<div style=" width: 100%; box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); transition: 0.3s;">
Proof by Induction
We will prove by induction that the derived closed form solution $T(n)=2^{n}-1$ satisfies the recurrence relation $T(n)= 2^{k}T(n-k)+2^{k}-1$.

Basis
base case: n=0, 1
0: trivial case, 0 discs requires 0 moves to solve
1: T(1)=2^{1}

</div>

## Test
<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        Accordion Item #1
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Accordion Item #2
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        Accordion Item #3
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
</div>

[back](./)

