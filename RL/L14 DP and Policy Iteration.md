### Policy Evaluation: Find out how good a policy is?

Policy evaluation answers the question of how good a policy is. Given an MDP and an arbitrary policy $\pi$, we will compute the state-value function. This is called policy evaluation in the DP literature. The idea is to turn bellman expectation equation discussed earlier to an update.

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_19.png)

To produce each successive approximation vk+1 from vk, iterative policy evaluation applies the same operation to each state s. It replaces the old value of s with a new value obtained from the old values of the successor states of s, and the expected immediate rewards, along all the one-step transitions possible under the policy being evaluated, until it converges to the true value function of a given policy $\pi$.

Let us understand policy evaluation using the very popular example of Gridworld.

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_20.png)

A bot is required to traverse a grid of 4×4 dimensions to reach its goal (1 or 16). Each step is associated with a reward of -1. There are 2 terminal states here: 1 and 16 and 14 non-terminal states given by \[2,3,….,15\]. Consider a random policy for which, at every state, the probability of every action {up, down, left, right} is equal to 0.25. We will start with initialising v<sub>0</sub> for the random policy to all 0s.

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_21.png)

This is definitely not very useful. Let’s calculate v<sub>2</sub> for all the states of 6:

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_22.png)

Similarly, for all non-terminal states, v<sub>1</sub>(s) = -1.

For terminal states p(s’/s,a) = 0 and hence v<sub>k</sub>(1) = v<sub>k</sub>(16) = 0 for all k. So v<sub>1</sub> for the random policy is given by:

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_23.png)

Now, for v<sub>2</sub>(s) we are assuming $\gamma$ or the discounting factor to be 1:

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_24.png)

As you can see, all the states marked in red in the above diagram are identical to 6 for the purpose of calculating the value function. Hence, for all these states, v<sub>2</sub>(s) = -2.

For all the remaining states, i.e., 2, 5, 12 and 15, v<sub>2</sub> can be calculated as follows:

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_25.png)

If we repeat this step several times, we get v<sub>$\pi$:</sub>

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_26.png)
---
### Policy Improvement: Improve an arbitrary policy

Using policy evaluation we have determined the value function v for an arbitrary policy $\pi$. We know how good our current policy is. Now for some state s, we want to understand what is the impact of taking an action _a_ that does not pertain to policy $\pi$.  Let’s say we select _a_ in _s,_ and after that we follow the original policy $\pi$. The value of this way of behaving is represented as:

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_27.png)

If this happens to be greater than the value function v<sub>$\pi$</sub>(s), it implies that the new policy $\pi$’ would be better to take. We do this iteratively for all states to find the best policy. Note that in this case, the agent would be following a greedy policy in the sense that it is looking only one step ahead.

Let’s get back to our example of gridworld. Using v<sub>$\pi$,</sub> the value function obtained for random policy $\pi$, we can improve upon $\pi$ by following the path of highest value (as shown in the figure below). We start with an arbitrary policy, and for each state one step look-ahead is done to find the action leading to the state with the highest value. This is done successively for each state.

As shown below for state 2, the optimal action is left which leads to the terminal state having a value . This is the highest among all the next states (0,-18,-20). This is repeated for all states to find the new policy.

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_28.png)

Overall, after the policy improvement step using v<sub>$\pi$</sub>, we get the new policy $\pi$’:

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_29.png)

Looking at the new policy, it is clear that it’s much better than the random policy. However, we should calculate v<sub>$\pi$</sub>’ using the policy evaluation technique we discussed earlier to verify this point and for better understanding.
---
### Policy Iteration: Policy Evaluation + Policy Improvement

Once the policy has been improved using v<sub>$\pi$</sub> to yield a better policy $\pi$’, we can then compute v<sub>$\pi$</sub>’ to improve it further to $\pi$".
> Repeated iterations are done to converge approximately to the true value function for a given policy $\pi$ (policy evaluation). 
Improving the policy as described in the *policy improvement* section is called *policy iteration*.

- $E$: Policy *Evaluation* (Value calculation)
- $I$: Policy *Improvement* (Updating policy based on Value)


![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_30.png)

In this way, the new policy is sure to be an improvement over the previous one and given enough iterations, it will return the optimal policy. This sounds amazing but there is a drawback – each iteration in policy iteration itself includes another iteration of policy evaluation that may require multiple sweeps through all the states. Value iteration technique discussed in the next section provides a possible solution to this.
---
### Value Iteration

We saw in the gridworld example that at around k = 10, we were already in a position to find the optimal policy. So, instead of waiting for the policy evaluation step to converge exactly to the value function v<sub>$\pi$</sub>, we could *stop earlier*.

We can also get the optimal policy with just 1 step of policy evaluation followed by updating the value function repeatedly (but this time with the updates derived from bellman optimality equation). 

Let’s see how this is done as a simple backup operation:

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_31.png)

This is identical to the bellman update in policy evaluation, with the difference being that we are taking the maximum over all actions. 

*Once the updates are small enough*, we can take the value function obtained as final and estimate the optimal policy corresponding to that.

#### Some important points related to DP:

1. DP can only be used if the model of the environment is known.
2.  Has a very high computational expense, i.e., it does not scale well as the number of states increase to a large number. An alternative called asynchronous dynamic programming helps to resolve this issue to some extent.


---
DP in action: Finding optimal policy for Frozen Lake environment using Python
-----------------------------------------------------------------------------

It is of utmost importance to first have a defined environment in order to test any kind of policy for solving an MDP efficiently. Thankfully, OpenAI, a non profit research organization provides a large number of environments to test and play with various reinforcement learning algorithms. To illustrate dynamic programming here, we will use it to navigate the Frozen Lake environment.
---
### Frozen Lake Environment

The agent controls the movement of a character in a grid world. Some tiles of the grid are walkable, and others lead to the agent falling into the water. Additionally, the movement direction of the agent is uncertain and only partially depends on the chosen direction. The agent is rewarded for finding a walkable path to a goal tile.

The surface is described using a grid like the following:

![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_33-300x184.png)

(S: starting point, safe),  (F: frozen surface, safe), (H: hole, fall to your doom), (G: goal)

The idea is to reach the goal from the starting point by walking only on frozen surface and avoiding all the holes. Installation details and documentation is available at this [link](https://gym.openai.com/docs/).

Once gym library is installed, you can just open a jupyter notebook to get started.

```
import gym
import numpy as np
env = gym.make('FrozenLake-v0')
```

Now, the env variable contains all the information regarding the frozen lake environment. Before we move on, we need to understand what an episode is. An episode represents a trial by the agent in its pursuit to reach the goal. An episode ends once the agent reaches a terminal state which in this case is either a hole or the goal.
---
### Policy Iteration in python

Description of parameters for policy iteration function

**policy:** 2D array of a size n(S) x n(A), each cell represents a probability of taking action a in state s.

**environment:** Initialized OpenAI gym environment object

**discount\_factor:** MDP discount factor

**theta:** A threshold of a value function change. Once the update to value function is below this number

**max\_iterations**: Maximum number of iterations to avoid letting the program run indefinitely

This function will return a vector of size nS, which represent a value function for each state.
---
Let’s start with the policy evaluation step. The objective is to converge to the true value function for a given policy $\pi$. We will define a function that returns the required value function.

```python
def policy_evaluation(policy, environment, discount_factor=1.0, theta=1e-9, max_iterations=1e9):
        # Number of evaluation iterations
        evaluation_iterations = 1
        # Initialize a value function for each state as zero
        V = np.zeros(environment.nS)
        # Repeat until change in value is below the threshold
        for i in range(int(max_iterations)):
                # Initialize a change of value function as zero
                delta = 0
                # Iterate though each state
                for state in range(environment.nS):
                       # Initial a new value of current state
                       v = 0
                       # Try all possible actions which can be taken from this state
                       for action, action_probability in enumerate(policy[state]):
                             # Check how good next state will be
                             for state_probability, next_state, reward, terminated in environment.P[state][action]:
                                  # Calculate the expected value
                                  v += action_probability * state_probability * (reward + discount_factor * V[next_state])
                       
                       # Calculate the absolute change of value function
                       delta = max(delta, np.abs(V[state] - v))
                       # Update value function
                       V[state] = v
                evaluation_iterations += 1
                
                # Terminate if value change is insignificant
                if delta &lt; theta:
                        print(f'Policy evaluated in {evaluation_iterations} iterations.')
                        return V
```

Now coming to the **policy improvement** part of the policy iteration algorithm. We need a helper function that does one step lookahead to calculate the state-value function. This will return an array of length nA containing expected value of each action

```python
def one_step_lookahead(environment, state, V, discount_factor):
        action_values = np.zeros(environment.nA)
        for action in range(environment.nA):
                for probability, next_state, reward, terminated in environment.P[state][action]:
                        action_values[action] += probability * (reward + discount_factor * V[next_state])
        return action_values
```
---
Now, the overall policy iteration would be as described below. This will return a tuple (policy,V) which is the optimal policy matrix and value function for each state.

```python
def policy_iteration(environment, discount_factor=1.0, max_iterations=1e9):
        # Start with a random policy
        #num states x num actions / num actions
        policy = np.ones([environment.nS, environment.nA]) / environment.nA
        # Initialize counter of evaluated policies
        evaluated_policies = 1
        # Repeat until convergence or critical number of iterations reached
        for i in range(int(max_iterations)):
                stable_policy = True
                # Evaluate current policy
                V = policy_evaluation(policy, environment, discount_factor=discount_factor)
                # Go through each state and try to improve actions that were taken (policy Improvement)
                for state in range(environment.nS):
                        # Choose the best action in a current state under current policy
                        current_action = np.argmax(policy[state])
                        # Look one step ahead and evaluate if current action is optimal
                        # We will try every possible action in a current state
                        action_value = one_step_lookahead(environment, state, V, discount_factor)
                        # Select a better action
                        best_action = np.argmax(action_value)
                        # If action didn't change
                        if current_action != best_action:
                                stable_policy = True
                                # Greedy policy update
                                policy[state] = np.eye(environment.nA)[best_action]
                evaluated_policies += 1
                # If the algorithm converged and policy is not changing anymore, then return final policy and value function
                if stable_policy:
                        print(f'Evaluated {evaluated_policies} policies.')
                        return policy, V
```
---
### Value Iteration in python

The parameters are defined in the same manner for value iteration. The value iteration algorithm can be similarly coded:

```python
def value_iteration(environment, discount_factor=1.0, theta=1e-9, max_iterations=1e9):
        # Initialize state-value function with zeros for each environment state
        V = np.zeros(environment.nS)
        for i in range(int(max_iterationsations)):
                # Early stopping condition
                delta = 0
                # Update each state
                for state in range(environment.nS):
                        # Do a one-step lookahead to calculate state-action values
                        action_value = one_step_lookahead(environment, state, V, discount_factor)
                        # Select best action to perform based on the highest state-action value
                        best_action_value = np.max(action_value)
                        # Calculate change in value
                        delta = max(delta, np.abs(V[state] - best_action_value))
                        # Update the value function for current state
                        V[state] = best_action_value
                        # Check if we can stop
                if delta &lt; theta:
                        print(f'Value-iteration converged at iteration#{i}.')
                        break

        # Create a deterministic policy using the optimal value function
        policy = np.zeros([environment.nS, environment.nA])
        for state in range(environment.nS):
                # One step lookahead to find the best action for this state
                action_value = one_step_lookahead(environment, state, V, discount_factor)
                # Select best action based on the highest state-action value
                best_action = np.argmax(action_value)
                # Update the policy to perform a better action at a current state
                policy[state, best_action] = 1.0
        return policy, V
```
---
Finally, let’s compare both methods to look at which of them works better in a practical setting. To do this, we will try to learn the optimal policy for the frozen lake environment using both techniques described above. Later, we will check which technique performed better based on the average return after 10,000 episodes.

```python
def play_episodes(environment, n_episodes, policy):
        wins = 0
        total_reward = 0
        for episode in range(n_episodes):
                terminated = False
                state = environment.reset()
                while not terminated:
                        # Select best action to perform in a current state
                        action = np.argmax(policy[state])
                        # Perform an action an observe how environment acted in response
                        next_state, reward, terminated, info = environment.step(action)
                        # Summarize total reward
                        total_reward += reward
                        # Update current state
                        state = next_state
                        # Calculate number of wins over episodes
                        if terminated and reward == 1.0:
                                wins += 1
        average_reward = total_reward / n_episodes
        return wins, total_reward, average_reward

# Number of episodes to play
n_episodes = 10000
# Functions to find best policy
solvers = [('Policy Iteration', policy_iteration),
           ('Value Iteration', value_iteration)]
for iteration_name, iteration_func in solvers:
        # Load a Frozen Lake environment
        environment = gym.make('FrozenLake-v0')
        # Search for an optimal policy using policy iteration
        policy, V = iteration_func(environment.env)
        # Apply best policy to the real environment
        wins, total_reward, average_reward = play_episodes(environment, n_episodes, policy)
        print(f'{iteration_name} :: number of wins over {n_episodes} episodes = {wins}')
        print(f'{iteration_name} :: average reward over {n_episodes} episodes = {average_reward} \n\n')
```
---
![](https://cdn.analyticsvidhya.com/wp-content/uploads/2018/09/im_36.jpg)

We observe that value iteration has a better average reward and higher number of wins when it is run for 10,000 episodes.



---
# [Grid World Demo](https://cs.stanford.edu/people/karpathy/reinforcejs/gridworld_dp.html)
[Grid World Demo](https://cs.stanford.edu/people/karpathy/reinforcejs/gridworld_dp.html)
---
# References



- ["Reinforcement Learning: An Introduction", Richard S. Sutton and Andrew G. Barto, 2nd Edition.](https://inst.eecs.berkeley.edu/~cs188/sp20/assets/files/SuttonBartoIPRLBook2ndEd.pdf)


- [Model Based Planning using Dynamic Programming](https://www.analyticsvidhya.com/blog/2018/09/reinforcement-learning-model-based-planning-dynamic-programming/)

- [Grid World Demo](https://cs.stanford.edu/people/karpathy/reinforcejs/gridworld_dp.html)



