# Unified Notation for Episodic and Continuing Tasks


Episodic tasks requires some additional notation. Rather than one long sequence of time steps, we need to consider a series of episodes, each of which consists of a finite sequence of time steps.

We have to refer not just to $S_t$ , the state representation at time $t$, but to $S_{t,i}$ , the state representation at time $t$ of episode $i$ (and similarly for $A_{t,i}$,
$R_{t,i}$, $\pi_{t,i}$, $T_{i}$ , etc.). 
> For simplicity we write $S_t$ to refer to $S_{t,i}$ , and so on.


To obtain a single notation that covers both episodic and continuing tasks. We have defined the return as a sum over a finite number of terms in one case and as a sum over an infinite number of terms in the other. These two can be unified by considering episode termination to be the entering of a special *absorbing state* that transitions only to itself and that generates only rewards of zero.

![](./L11_01.png)

Here the solid square represents the special absorbing state corresponding to the end of an
episode. Starting from $S_0$ , we get the reward sequence $+1, +1, +1, 0, 0, 0, . . ..$ Summing
these, we get the same return whether we sum over the first $T$ rewards (here $T=3$) or
over the full infinite sequence. This remains true even if we introduce discounting.

$$G_t=\sum\limit_{k=t+1}^T\gamma^{k-t-1}R_k$$

We can write $G_t$ thereby including possibility that $T=\infty$ or $\gamma=1$ **(but not both)**.

---

# Policies and Value Functions







