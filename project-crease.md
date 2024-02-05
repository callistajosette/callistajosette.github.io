---
layout: default
---

# Solving Recurrences

<p align="center">
  1. Unrolling the Recurrence
  2. Recurrence Trees
  3. Akra–Bazzi method
  3. Annihilator functions
</p>

## Description

A recurrence is a recursive description of a function, or in other words, a description of a function in terms of itself. Like all recursive structures, a recurrence consists of one or more base cases and one or more recursive cases. We say that a particular function satisfies a recurrence, or is the solution to a recurrence if each of the statements of a recurrence holds. Closed-form recurrence solutions are particularly valuable for bounds analysis 

## Unrolling the Recurrence
Unrolling a recurrence is a strategy we typically use when the recursive case only has one recursive call. That is, if the recursive case looks like $T(n)=T(n/2)+$[non-recursive work], for example.
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

<div class="accordion">
  <div class="accordion-item">
    <input type="checkbox" class="accordion-input" id="p1-1">
    <label class="accordion-header" for="p1-1">+ Let's prove by induction that this holds for all $k \in \mathbb Z^+_0$</label>
    <div class="accordion-content">
      <p>
      We will prove by induction P(n): unrolling the Hanoi recurrence $k$ times yields $T(n) = 2^{k}T(n-k) + 2^{k}-1$ for all $k \in \mathbb Z^+_0$<br><br> 
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

We derive an exact solution to the recurrence relation.

### Ex. 2 Another Recurrence
Consider the recurrence relation given by $T(1) = 1$, $T(n) = 2T(\frac{n}{2}) + n^{2}$
<center>
$$
\begin{align*}
\boldsymbol{T(n)} & = \boldsymbol{2T(\frac{n}{2}) + n^{2}} \text{, and} \\
T(\frac{n}{2}) & = 2T(\frac{\frac{n}{2}}{2}) + (\frac{n}{2})^{2} \\
& = 2T(\frac{n}{2}*\frac{1}{2}) + (\frac{n}{2})^{2} \\
& = 2T(\frac{n}{2^{2}}) + (\frac{n}{2})^{2} \\
\end{align*}
$$
so
$$
\begin{align*}
T(n) & = 2(2T(\frac{n}{2^{2}})+(\frac{n}{2})^{2}) + n^{2} \\
& = 2^{2}T(\frac{n}{2^{2}})+2(\frac{n}{2})^{2} + n^{2} \\
& = 2^{2}T(\frac{n}{2^{2}})+(2*\frac{1}{2}*\frac{1}{2}*n*n) + n^{2} \\
& \boldsymbol{= 2^{2}T(\frac{n}{2^{2}})+(\frac{n^{2}}{2}) + n^{2}} \text{, and} \\
T(\frac{n}{2^{2}}) & = 2T(\frac{\frac{n}{2^{2}}}{2}) + (\frac{n}{2^{2}})^{2} \\
& = 2T(\frac{n}{2^{3}}) + (\frac{n}{2^{2}})^{2} \\
\end{align*}
$$
so
$$
\begin{align*}
T(n) & = 2(2^{2}T(\frac{n}{2^{3}})+(\frac{n}{2})^{2})+ (\frac{n^{2}}{2}) + n^{2} \\
& = 2^{3}T(\frac{n}{2^{3}})+(2*\frac{1}{2}*\frac{1}{2}*\frac{1}{2}*\frac{1}{2}*n*n)+ (\frac{n^{2}}{2}) + n^{2} \\
& \boldsymbol{= 2^{3}T(\frac{n}{2^{3}})+(\frac{n^{2}}{2^{2}})+ (\frac{n^{2}}{2}) + n^{2}}
\end{align*}
$$  
</center>

So it looks like unrolling the initial recurrence k times for $k \in \mathbb Z^+_0$, will give us a new recurrence

$$T(n) = 2^{k}T(\frac{n}{2^{k}}) + \sum_{i=0}^{k-1} \frac{n^{2}}{2^{i}} \\$$


<div class="accordion">
  <div class="accordion-item">
    <input type="checkbox" class="accordion-input" id="p2-1">
    <label class="accordion-header" for="p2-1">+ Let's prove by induction that this holds for all $k \in \mathbb Z^+_0$</label>
    <div class="accordion-content">
      <p>
      We will prove by induction P(n): unrolling the recurrence $k$ times yields $T(n) = 2^{k}T(\frac{n}{2^{k}}) + \sum_{i=0}^{k-1} \frac{n^{2}}{2^{i}}$ for all $k \in \mathbb Z^+_0$<br><br> 
      <u>Basis:</u> We will show $P(k=0)$ holds<br>
      $P(k=0)$ trivially holds; since we have unrolled the recurrence 0 times, we do not enter the generator<br>
      $\rightarrow$ So we have shown that P(n) holds for $k=0$.<br><br>
      <u>Inductive Step:</u> We will show $P(k \geq 0)$ holds<br> 
      Inductive Hypothesis:
      Assume $P(k-1) \rightarrow$ $T(n) = 2^{k-1}T(\frac{n}{2^{k-1}}) + \sum_{i=0}^{(k-1)-1} \frac{n^{2}}{2^{i}}$<br><br>
      Wts. $P((k-1)+1): P(k) \rightarrow$ $T(n) = 2^{k}T(\frac{n}{2^{k}}) + \sum_{i=0}^{k-1} \frac{n^{2}}{2^{i}}$<br><br>
      We have:<br>
      $T(n) = 2^{k-1}T(\frac{n}{2^{k-1}}) + \sum_{i=0}^{(k-1)-1} \frac{n^{2}}{2^{i}}$<br><br>
      Then by defn. of unrolling we derive from $P(k-1)$...<br>
      $T(n) = 2^{k-1}(2T(\frac{n}{2^{k}})+(\frac{n}{2^{k-1}})^{2}) + \sum_{i=0}^{(k-1)-1} \frac{n^{2}}{2^{i}}$, <br>
      $T(n)=2^{k}T(\frac{n}{2^{k}})+(n*n*\frac{1}{2^{k-1}}*\frac{1}{2^{k-1}}*2^{(k-1)-1}) + \sum_{i=0}^{k-1} \frac{n^{2}}{2^{i}}$<br>
      $T(n)=2^{k}T(\frac{n}{2^{k}})+\frac{n^{2}}{2^{k-1}} + \sum_{i=0}^{(k-1)-1} \frac{n^{2}}{2^{i}}$<br><br>
      Then notice that we can combine $\frac{n^{2}}{2^{k-1}}$ and $\sum_{i=0}^{(k-1)-1} \frac{n^{2}}{2^{i}}$ to $\sum_{i=0}^{k-1} \frac{n^{2}}{2^{i}}$. So...<br>
      $T(n) = 2^{k}T(\frac{n}{2^{k}}) + \sum_{i=0}^{k-1} \frac{n^{2}}{2^{i}}$<br>
      $\rightarrow$So we have shown that P(n) holds for $k\geq 0$<br><br>
      So we have shown that P(n) holds for all $k \in \mathbb Z^+_0$.
      $$\tag*{$\blacksquare$}$$
      </p>
    </div>
  </div>
</div>

Let's strategically unroll the recurrence until we reach a known base case, say $T(1)$. Note that to get our recursive term $T(\frac{n}{2^{k}})$ to $T(1)$ we need to choose a $k$ such that $2^{k}=n$.
<center>
$$
\begin{align*}
2^{k} & =n \\
\log _{2} 2^{k} & =\log _{2} n \\
k* \log _{2} 2 & =\log _{2} n \\
k & =\log _{2} n \\
\end{align*}
$$  
so
$$
\begin{align*}
T(n) & =2^{\log _{2} n}T(\frac{n}{2^{\log _{2} n}})+\sum_{i=0}^{(\log _{2} n)-1} \frac{n^{2}}{2^{i}} \\
& =n*T(1)+\sum_{i=0}^{(\log _{2} n)-1} \frac{n^{2}}{2^{i}} \\
& =n+\sum_{i=0}^{(\log _{2} n)-1} \frac{n^{2}}{2^{i}} \\
\end{align*}
$$ 
</center>
To simplify this expression, we can evaluate the last term using the formula for the sum of a geometric series ($\sum_{i=0}^{k} ar^{i} = \frac{a \cdot (1 - r^{k+1})}{1 - r}$, where here our $a=n^{2}$, $r=\frac{1}{2}$, and $k=\log _{2}{n} -1$)
<center>
$$
\begin{align*}
T(n)& =n+n^{2}(\frac{1-\frac{1}{2}^{(\log _{2}{n}-1)+1}}{1-\frac{1}{2}})\\
& =n+n^{2}(\frac{1-\frac{1}{n}}{\frac{1}{2}})\\
&= n+n^{2}(2-\frac{2}{n})\\
&= 2n^{2}-\frac{2n^{2}}{n}+n\\
&= 2n^{2}-2n+n\\
&=2n^{2}-n
\end{align*}
$$  
</center>

We derive an exact solution to the recurrence relation.

## Recurrence Trees
### Ex. 1 Naive Karatsuba's Multiplication Method
Naive Karatsuba's multiplication method is given by the recurrence $T(n)=4T((n/2)+O(n)$.

![Karatsuba's Recursion Tree](/assets/img/karatsuba.png)

To find $\ell$, the height of our tree, notice that reaching $\ell$ means we have performed sufficient splits to reach a base case (we reach a subproblem consisting of only one digit). Mathematically, this is approximately equivalent to the case where...
<center>
$$ 
\begin{align*}
\frac{n}{2^{\ell}} & \leq 1 \\
\frac{1}{2^{\ell}} & \leq \frac{1}{n} \\
2^{\ell} & \leq n \\
\text{so } \ell & \approx \log _{2} n \\
\end{align*}
$$ 
</center>

At each level of the tree we are doing $2^{\ell}n$ work, and we can define a new recurrence in terms of total work completed $T(n)=\sum_{i=0}^{\ell - 1} 2^{i}n$.

![Karatsuba's Recursion Tree Annotated](/assets/img/karatsuba annotated.png)
<script src="https://gist.github.com/callistajosette/762cd63e8c868e0f3b94fef99f4a13eb.js"></script>

Then we can calculate an exact solution for T(n) by substituting in the depth of our tree and evaluating the resulting expression as a geometric series.
<center>
$$ 
\begin{align*}
T(n) & =\sum_{i=0}^{(\log _{2} n)-1} 2^{i}n \\
& = n(\frac{2^{(\log _{2} n -1) +1}-1}{2-1}) \\
& = n(n-1)
\end{align*}
$$ 
</center>

### Ex. 2 Longest Increasing Subsequence
The longest increasing subsequence problem is given by the recurrence $T(n)=2T(n-1)+O(1)$ when memoization is not leveraged.

In this case our $\ell$ should be $n$ because reaching $\ell$ means we have checked for LIS's in all but the last digit (which is a base case and has a known LIS of $1$).

At each level of the tree we are doing $2^{\ell}O(1)$ work, so our new recurrence is $T(n)=\sum_{i=0}^{\ell - 1} 2^{i}O(1)$.

![LIS Backtracking Recursion Tree](/assets/img/lis backtracking.png)

We obtain an exact solution to $T(n)$ by evaluating our recurrence as a geometric series

<center>
$$ 
\begin{align*}
T(n) & =\sum_{i=0}^{(n)-1} 2^{i}O(1) \\
& = O(1)(\frac{2^{(n-1)+1}-1}{2-1}) \\
& = O(1)(2^{n}-1)
\end{align*}
$$ 
</center>

### More Recursion Tree Examples
<div class="accordion">
  <div class="accordion-item">
    <input type="checkbox" class="accordion-input" id="p5-1">
    <label class="accordion-header" for="p5-1">+ $A(n)= 2A(n/4)+\sqrt{n}$</label>
    <div class="accordion-content">
      <p>
        <img src="/assets/img/more%20recursion%20trees%20a.png" alt="A(n)">       
      </p>
    </div>
  </div>
    <div class="accordion-item">
    <input type="checkbox" class="accordion-input" id="p5-2">
    <label class="accordion-header" for="p5-2">+ $B(n)= 2B(n/4)+n$</label>
    <div class="accordion-content">
      <p>
        <img src="/assets/img/more%20recursion%20trees%20b.png" alt="B(n)">       
      </p>
    </div>
  </div>
    <div class="accordion-item">
    <input type="checkbox" class="accordion-input" id="p5-3">
    <label class="accordion-header" for="p5-3">+ $C(n)= 2C(n/4)+n^{2}$</label>
    <div class="accordion-content">
      <p>
        <img src="/assets/img/more%20recursion%20trees%20c.png" alt="C(n)">       
      </p>
    </div>
  </div>
      <div class="accordion-item">
    <input type="checkbox" class="accordion-input" id="p5-4">
    <label class="accordion-header" for="p5-4">+ $C(n)= 3C(n/3)+\sqrt{n}$</label>
    <div class="accordion-content">
      <p>
        <img src="/assets/img/more%20recursion%20trees%20d.png" alt="C(n)">       
      </p>
    </div>
  </div>
</div>


## Credits
These notes were compiled from various freely accessible online sources, most notably course handouts provided to students at the University of Washington, and the University of Illinois Urbana-Champaign. 

[back](./)

