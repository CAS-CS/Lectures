# Dynamic Programming (DP)

**Dynamic Programming (DP)** is a technique used in computer science and mathematics to solve problems by breaking them down into simpler subproblems and solving each subproblem only once, storing the solutions for future use. It is particularly useful for optimization problems where the goal is to find the best solution among a set of possible solutions.

The key idea behind dynamic programming is to solve a problem by solving its smaller subproblems and combining their solutions. The method is applicable to problems exhibiting the **optimal substructure** and **overlapping subproblems** properties.

- **Optimal Substructure:** The optimal solution to the problem can be constructed from the optimal solutions of its subproblems.

- **Overlapping Subproblems:** The problem can be broken down into subproblems, and solutions to the same subproblem are reused multiple times.
---
### Why Dynamic Programming?

1. **Optimization Problems:** DP is particularly effective for solving optimization problems where you need to find the best solution among a set of feasible solutions.

2. **Time Complexity:** By solving and storing the solutions to subproblems, DP avoids redundant computations, leading to significant time savings, especially for problems with overlapping subproblems.

3. **Memory Efficiency:** DP often uses a memory mechanism called memoization to store solutions to subproblems, making it memory-efficient compared to naive recursive solutions.

4. **Deterministic Algorithms:** DP provides deterministic algorithms, meaning the same input will always produce the same output. This determinism is crucial in many applications, including algorithmic problem-solving and optimization.

5. **Examples of DP Applications:**
   - **Fibonacci Sequence:** Computing Fibonacci numbers using naive recursion involves redundant calculations, while DP can optimize this by storing previously computed values.
   - **Shortest Path Problems:** DP is used to find the shortest paths in graph problems.
   - **Sequence Alignment:** DP is applied in bioinformatics for comparing DNA, RNA, or protein sequences.
   - **Resource Allocation:** It is used in optimization problems like the knapsack problem.


---
### Types of Dynamic Programming:

1. **Top-down (Memoization):** The problem is solved in a recursive manner, and the solutions to subproblems are stored for reuse.

2. **Bottom-up (Tabulation):** The problem is solved iteratively, starting from the smallest subproblems and building up to the overall problem.

### Example:

Consider the Fibonacci sequence. The naive recursive solution has exponential time complexity due to redundant calculations, while a DP solution (either top-down or bottom-up) reduces the time complexity to linear.

**Naive Recursive Solution:**
```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)
```

**Dynamic Programming Solution (Top-down):**
```python
def fibonacci_dp(n, memo={}):
    if n <= 1:
        return n
    if n not in memo:
        memo[n] = fibonacci_dp(n - 1, memo) + fibonacci_dp(n - 2, memo)
    return memo[n]
```

**Dynamic Programming Solution (Bottom-up):**
```python
def fibonacci_dp_bottom_up(n):
    if n <= 1:
        return n
    dp = [0] * (n + 1)
    dp[1] = 1
    for i in range(2, n + 1):
        dp[i] = dp[i - 1] + dp[i - 2]
    return dp[n]
```

> In summary, dynamic programming is a powerful technique used to solve optimization problems efficiently by breaking them down into subproblems and reusing solutions. It is widely applied in algorithm design, optimization, and various fields of computer science.


---
# Dynamic programming in reinforcement learning 

Dynamic programming is a powerful technique used in reinforcement learning to solve problems by breaking them down into smaller, simpler subproblems. 

- The key idea is to solve each subproblem only once and store the solutions, which can then be reused to solve larger problems efficiently. 
> In reinforcement learning, the Bellman equation is often used to express the optimal value function in terms of smaller subproblems.

Consider a gridworld navigation problem where an agent moves through a grid, and at each cell, it can take one of four actions: up, down, left, or right. The goal is to find the optimal policy that maximizes the expected cumulative reward.
---
### Example: Gridworld
Consider a gridworld navigation problem where an agent moves through a grid, and at each cell, it can take one of four actions: **up, down, left, or right**. *The goal is to find the optimal policy that maximizes the expected cumulative reward.*

#### Definitions:
- **States (S):** Each cell in the grid represents a state.
- **Actions (A):** The possible actions are moving up, down, left, or right.
- **Transition Probability (P):** The probability of reaching state s' from state s by taking action a.
- **Reward (R):** The immediate reward obtained when transitioning from state s to s' by taking action a.
- **Discount Factor (γ):** A value between 0 and 1 that discounts future rewards.

#### Bellman Equation:
The Bellman equation for the state value function (V) is given by:

\[ V(s) = \max_a \left( \sum_{s'} P_{ss'}^a [R_{ss'}^a + \gamma V(s')] \right) \]

where:
- \(V(s)\) is the value of state s,
- \(a\) is an action,
- \(P_{ss'}^a\) is the transition probability from state s to s' when taking action a,
- \(R_{ss'}^a\) is the immediate reward when transitioning from state s to s' by taking action a,
- \(\gamma\) is the discount factor.


---


#### Dynamic Programming Solution:

1. **Initialization:**
   Initialize the value function \(V(s)\) for all states.

2. **Iteration:**
   Repeat until convergence:
   \[ V(s) \leftarrow \max_a \left( \sum_{s'} P_{ss'}^a [R_{ss'}^a + \gamma V(s')] \right) \]

   This update is performed for each state in the grid.

3. **Policy Extraction:**
   Once the value function has converged, the optimal policy can be extracted as:
   \[ \pi^*(s) = \arg\max_a \left( \sum_{s'} P_{ss'}^a [R_{ss'}^a + \gamma V(s')] \right) \]

### Python Code:

Python code using dynamic programming to solve the gridworld problem:

```python
import numpy as np

# Define gridworld parameters
num_rows = 3
num_cols = 4
num_actions = 4
gamma = 0.9  # discount factor

# Initialize the value function
V = np.zeros((num_rows, num_cols))

# Define transition probabilities and rewards (simplified for illustration)
P = np.ones((num_rows, num_cols, num_actions, num_rows, num_cols)) / num_actions
R = np.zeros((num_rows, num_cols, num_actions, num_rows, num_cols))
R[0, 1, 1, 0, 2] = 1  # example: reward of 1 for moving right from (0,1) to (0,2)

# Dynamic Programming Iteration
num_iterations = 100
for _ in range(num_iterations):
    new_V = np.zeros_like(V)
    for i in range(num_rows):
        for j in range(num_cols):
            for a in range(num_actions):
                new_V[i, j] = max(new_V[i, j], np.sum(
                    P[i, j, a, i_prime, j_prime] * (R[i, j, a, i_prime, j_prime] + gamma * V[i_prime, j_prime])
                    for i_prime in range(num_rows) for j_prime in range(num_cols)
                ))
    V = new_V

# Extract Optimal Policy
optimal_policy = np.zeros((num_rows, num_cols), dtype=int)
for i in range(num_rows):
    for j in range(num_cols):
        optimal_policy[i, j] = np.argmax(
            [np.sum(P[i, j, a, i_prime, j_prime] * (R[i, j, a, i_prime, j_prime] + gamma * V[i_prime, j_prime])
                    for i_prime in range(num_rows) for j_prime in range(num_cols)]
             for a in range(num_actions)]
        )

print("Optimal Value Function:")
print(V)
print("\nOptimal Policy:")
print(optimal_policy)
```

This is a basic example to give you a sense of how dynamic programming can be applied to reinforcement learning problems. 
> In practice, more sophisticated algorithms like *policy iteration* or *value iteration* are often used for larger problems.
---
# References

- ["Reinforcement Learning: An Introduction", Richard S. Sutton and Andrew G. Barto, 2nd Edition.](https://inst.eecs.berkeley.edu/~cs188/sp20/assets/files/SuttonBartoIPRLBook2ndEd.pdf)






