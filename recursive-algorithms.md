---
layout: default
---

# Recursive Algorithms

<p align="center">
  1. <a href="#Towers%20of%20Hanoi">Towers of Hanoi</a>
</p>

## Towers of Hanoi

### Problem Description
In the great temple at Benares ...beneath the dome which marks the center of the world, rests a brass plate in which are fixed three diamond needles, each a cubit high and as thick as the body of a bee. On one of these needles, at the creation, God placed sixty-four discs of pure gold, the largest disc resting on the brassplate, and the others getting smaller and smaller up to the top one. This is the Tower of Bramah. Day and night unceasingly the priests transfer the discs from one diamond needle to another according to the fixed and immutable laws of Bramah, which require that the priest on duty must not move more than one disc at a time and that he must place this disc on a needle so that there is no smaller disc below it. When the sixty four discs shall have been thus transferred from the needle on which at the creation God placed them to one of the other needles, tower, temple, and Brahmins alike will crumble into dust, and with a thunderclap the world will vanish.

### Algorithm Synthesis
Pseudocode:
<pre id="quicksort" class="pseudocode">
% Towers of Hanoi algorithm pseudocode
\begin{algorithm}
\begin{algorithmic}
\FUNCTION{Hanoi}{src, int, dst, numDisks}
    \IF{numDisks $> 0$} 
        \STATE \CALL{Hanoi}{src, dst, int, numDisks-1}
\STATE move disk n from src to dst
        \STATE \CALL{Hanoi}{int, src, dst, numDisks-1}
    \ENDIF
\ENDFUNCTION
\end{algorithmic}
\end{algorithm}
</pre>

### Algorithm Implementation
<iframe src="https://trinket.io/embed/python/623f6a05f8?runOption=run" width="100%" height="425" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen></iframe>

### Algorithm Analysis
The Towers of Hanoi recurrence relation is given by $T(n) = 2T(n-1) + 1$. This reflects that the algorithm breaks down the problem into two (n-1)-sized subproblems: moving the top $(n-1)$ disks to the intermediate peg, then relocating those same $(n-1)$ disks to the destination peg, along with one additional move for the base. Solving this recurrence yields $O(2^n)$ time complexity. 


## Credits
These algorithm implementations are practice problems I have largely collected from Jeff Erickson's book, Algorithms. Throughout my time in University, although we were often tasked to develop algorithms, I realized I had no idea how to implement any of them in any useful or meaningful way. This page documents my progress practicing full scale algorithm integration from synthesis to implementation.

[back](./)

<script>
    pseudocode.renderClass("pseudocode");
</script>
