# Monte Carlo methods

Monte Carlo methods are a class of computational algorithms that rely on *repeated random sampling* to obtain *numerical results*. In the context of reinforcement learning, Monte Carlo methods are often used for estimating the value of states in a Markov Decision Process (MDP) and for learning optimal policies.

### Estimating the value of pi using Monte Carlo
<svg width="200" height="200" viewbox="50 00 50 50">   <rect width="100" height="100" style="fill:hsla(180,30%,60%,.8);stroke-width:2;stroke:hsla(180,30%,10%,.8)" />  <circle cx="50" cy="50" r="50" stroke=hsla(18,30%,10%,.8) stroke-width="1" fill=hsla(20,30%,60%,.8) /></svg>
Estimating the value of pi using Monte Carlo simulation is a classic and simple example of how this technique can be applied. 
> The basic idea is to use random sampling to approximate the ratio of the areas of a circle and a square, which can then be used to estimate pi.

#### 1. **Setup:**
   
- Consider a unit square with a side length of 1, centered at the origin (0,0).
- Inside this square, inscribe a quarter circle with a radius of 1 (i.e., the circle is tangent to the square at the top right corner).

#### 2. **Random Sampling:**
   
- Generate random points uniformly within the square.

#### 3. **Check Point Location:**
   
- For each random point, check whether it falls inside the inscribed quarter circle.

#### 4. **Counting:**
   
- Keep track of the number of points that fall inside the quarter circle and the total number of generated points.

#### 5. **Estimate Pi:**
   
- The ratio of the number of points inside the quarter circle to the total number of points is approximately equal to the ratio of the areas of the quarter circle and the square.
   
- The area of the quarter circle is \( \frac{\pi}{4} \), and the area of the square is 1.
   
- So, the estimated value of pi (\( \pi \)) can be calculated as follows:
     \[ \text{Estimated } \pi \approx 4 \times \left(\frac{\text{Points inside the quarter circle}}{\text{Total points generated}}\right) \]

**Python Example:**
try this Python code to estimate pi using Monte Carlo simulation:

```python
import random

def estimate_pi(num_samples):
    points_inside_circle = 0

    for _ in range(num_samples):
        x = random.uniform(0, 1)
        y = random.uniform(0, 1)

        distance = x**2 + y**2

        if distance <= 1:
            points_inside_circle += 1

    estimated_pi = 4 * (points_inside_circle / num_samples)
    return estimated_pi

# Example: Estimate pi using 100000 samples
estimated_pi_value = estimate_pi(100000)
print("Estimated pi:", estimated_pi_value)
```

The more samples you use, the closer your estimate should be to the actual value of pi $\pi$. This demonstrates, of how Monte Carlo methods can be used for numerical estimation.

## Monte Carlo simulation in the context of reinforcement learning:

#### Objective:

- The main goal of Monte Carlo methods in reinforcement learning is to estimate the value function or policy by averaging the returns from multiple simulated episodes.

#### Episodic Tasks:

- Monte Carlo methods are typically applied to episodic tasks, where an agent interacts with the environment for a finite number of time steps and then the episode ends.

#### Estimating State Values:

- Suppose you want to estimate the value of a particular state \(s\) in an MDP. To do this using Monte Carlo methods, you run multiple episodes, and for each episode, you record the total return (sum of rewards) from the time step the agent first enters state \(s\) until the end of the episode.

- The estimated value of state \(s\) is then the average of all these returns.

#### First-Visit and Every-Visit Monte Carlo:

- There are two common variants of Monte Carlo methods: first-visit and every-visit.
1. In first-visit Monte Carlo, you only consider the returns from the first time the agent visits state \(s\) in each episode.
2. In every-visit Monte Carlo, you consider all visits to state \(s\) in each episode.

#### Policy Evaluation:

- Monte Carlo methods are often used for policy evaluation, where the goal is to estimate the value function of a given policy.

#### Control Using Monte Carlo:

- In addition to policy evaluation, Monte Carlo methods can be used for policy improvement and control. This involves iteratively improving the policy based on the estimated value functions.

#### Exploration-Exploitation Trade-off:

- Like other reinforcement learning methods, Monte Carlo methods need to balance exploration and exploitation. This can be achieved through strategies such as epsilon-greedy policies.

> Monte Carlo methods in reinforcement learning are used for estimating the value of states by simulating episodes and averaging the returns. These methods are particularly useful in episodic tasks and provide a way to learn from actual experiences rather than relying on a model of the environment.

---

### Batch Reinforcement Learning:

**Definition:**
Batch Reinforcement Learning refers to the scenario where an agent learns from a fixed batch of data, collected from a prior policy or by interacting with the environment, rather than through online interactions.

### Key Concepts:

#### Batch Data:

The agent is provided with a fixed dataset containing experiences from a previous policy or interaction with the environment. This dataset is not updated during the learning process.

#### Offline Learning:

Unlike online learning where an agent continually interacts with the environment, batch RL focuses on offline learning from the given dataset.

#### Policy Evaluation:

The primary goal is often policy evaluation, i.e., estimating the value function or learning a policy from the batch data.

**Example:**

> Consider a scenario where a self-driving car has collected a large dataset of experiences from previous drives. Each experience consists of the car's state, the action taken, the resulting state, and the associated reward. Batch Reinforcement Learning can be applied to this dataset to train a model that can make better decisions in similar driving scenarios.

The agent would use the collected data to estimate the value function or policy, allowing it to improve decision-making without further exploration in the actual environment.
---

### Monte Carlo Tree Search (MCTS):

**Definition:**
Monte Carlo Tree Search is a simulation-based search algorithm commonly used for decision-making in games and sequential decision problems. It builds a tree of possible actions and their outcomes, using random sampling to estimate the values of different nodes in the tree.

**Key Concepts:**

#### Tree Expansion:

MCTS grows a tree iteratively, starting from the root (current game state). In each iteration, it selects a promising node, expands the tree from that node, and simulates the game from the newly expanded node.

#### Rollouts:

During simulation, the algorithm performs a rollout by selecting actions randomly or using a simple heuristic until a terminal state (end of the game) is reached. The result of the rollout is used to estimate the value of the expanded node.

#### Backpropagation:

The estimated values from the rollout are backpropagated up the tree to update the values of the nodes traversed during the selection and expansion phases.

**Example:**

> Imagine a game of chess where MCTS is employed to decide the best move for the current position. The algorithm starts with the current state of the chessboard as the root node. In each iteration, it selects a child node (a potential move) based on a trade-off between exploration and exploitation. It then expands the tree by considering possible next moves.

During simulation (rollout), the algorithm plays out the game randomly or using a simple policy until it reaches a terminal state (checkmate or a draw). The result of the rollout is backpropagated to update the values of the nodes along the path.

Over several iterations, MCTS refines its estimate of the values of different moves, helping the algorithm make better decisions in the face of uncertainty.

> Batch Reinforcement Learning deals with learning from a fixed dataset, while Monte Carlo Tree Search is an algorithm for sequential decision-making that uses tree exploration and random simulations to guide decision-making in complex domains.