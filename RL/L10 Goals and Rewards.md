# Goals and Rewards
In reinforcement learning, the purpose or goal of the agent is formalized in terms of a special signal, called the reward, passing from the environment to the agent. At each time step, the reward is a simple number, Rt 2 R. Informally, the agent’s goal is to maximize the total amount of reward it receives. *This means maximizing not immediate reward, but cumulative reward in the long run.*

### Reward hypothesis
> That all of what we mean by goals and purposes can be well thought of as the maximization of the expected value of the cumulative sum of a received scalar signal (called reward).

For an agent to learn to play checkers or chess, the natural rewards are +1 for winning, 1 for losing, and 0 for drawing and for all nonterminal positions.

> The agent always learns to maximize its reward. If we want it to do something for us, we must provide rewards to it in such a way that in maximizing them the agent will also achieve our goals. It is thus critical that the rewards we set up truly indicate what we want accomplished. In particular, the reward signal is not the place to impart to the agent prior knowledge about how to achieve what we want it to do.5 For example, a chess-playing agent should be rewarded only for actually winning, not for achieving subgoals such as taking its opponent’s pieces or gaining control of the center of the board. If achieving these sorts of subgoals were rewarded, then the agent might find a way to achieve them without achieving the real goal. For example, it might find a way to take the opponent’s pieces even at the cost of losing the game. 

###### The reward signal is your way of communicating to the robot what you want it to achieve, not how you want it achieved.







---
# Returns and Episodes

The agent’s goal is to maximize the cumulative reward it receives in the long run. 

If the sequence of rewards received after time step t is denoted $R_{t+1}$, $R_{t+2}$, $R_{t+3}$, $\ldots$, then what precise aspect of this sequence do we wish to maximize? In general, we seek to *maximize the expected return*, where the return, denoted $G_t$, where T is a final time step.

$$G_t=R_{t+1}+R_{t+2}+R_{t+3}+\ldots+R_{T}$$

This makes sense in applications in which there is a natural notion of final time step, that is, when the agent–environment interaction breaks naturally into subsequences, which we call *episodes* (some times called *trials*).

The next episode begins independently of how the previous one ended. Thus the episodes can all be considered to end in the same terminal state, with different rewards for the different outcomes. Tasks with episodes of this kind are called *episodic tasks*. 

> In episodic tasks we sometimes need to distinguish the set of all nonterminal states, denoted $\math{S}$, from the set of all states plus the terminal state, denoted $\math{S}+$ . The time of termination, $T$, is a random variable that normally varies from episode to episode.

# Returns and Episodes
## Continious cases and discounting

In many cases the agent–environment interaction does not break naturally into identifiable episodes, but goes on continually without limit. For example, this would be the natural way to formulate an on-going process-control task, or an application to a robot with a long life span. We call these continuing tasks.

**The return formulation is problematic for continuing tasks because the final time step would be $T=\infty$ and the return, which is what we are trying to maximize, could itself easily be infinite.**

We usually use a definition of return that is slightly more complex conceptually but much simpler mathematically.

### Discounting

The additional concept that we need is that of *discounting*.
$$G_t=R_{t+1}+\gamma R_{t+2}+\gamma^2 R_{t+3}+\ldots = \sum\limits_{k=0}^\infty R_{t+k+1}$$
where $\gamma$ is a parameter, $0\leq\gamma\leq1$, called the *discount rate*.


The discount rate determines the present value of future rewards: a reward received $k$ time steps in the future is worth only $\gamma^{k-1}$ times what it would be worth if it were received immediately. If $\gamma<1$, the infinite sum in $G_t$ has a finite value as long as the reward sequence $\{Rk\}$ is bounded. If $\gamma=0$, the agent is ``myopic" in being concerned only with maximizing immediate rewards: its objective in this case is to learn how to choose $A_t$ so as to maximize only $R_{t+1}$

> Acting to maximize immediate reward can reduce access to future rewards so that the return is reduced. As $\gamma$ approaches 1, the return objective takes future rewards into account more strongly; the agent becomes more farsighted.

Returns at successive time steps are related to each other in a way that is important for the theory and algorithms of reinforcement learning:

$$G_t=&R_{t+1}+\gamma R_{t+2}+\gamma^2 R_{t+3}+\gamma^3 R_{t+4}+\ldots\\=&R_{t+1}+\gamma (R_{t+2}+\gamma R_{t+3}+\gamma^2 R_{t+4}+\ldots)\\=&R_{t+1}+\gamma G_{t+1}$$

Note that although the return is a sum of an infinite number of terms, it is still finite if the reward is nonzero and constant -- if $\gamma<1$. For example, if the reward is a constant $+1$, then the return is

$$G_t=\sum\limits_{k=0}^\infty \gamma^k = \frac{1}{1-\gamma}$$


---
# Assignment

### Exercise 3.5 
The equations in Section 3.1 are for the continuing case and need to be modified (very slightly) to apply to episodic tasks. Show that you know the modifications needed by giving the modified version of (3.3).



















---
# References

- ["Reinforcement Learning: An Introduction", Richard S. Sutton and Andrew G. Barto, 2nd Edition.](https://inst.eecs.berkeley.edu/~cs188/sp20/assets/files/SuttonBartoIPRLBook2ndEd.pdf)
