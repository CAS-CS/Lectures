# Monte Carlo methods

Monte Carlo methods are a class of computational algorithms that rely on *repeated random sampling* to obtain *numerical results*. In the context of reinforcement learning, Monte Carlo methods are often used for estimating the value of states in a Markov Decision Process (MDP) and for learning optimal policies.

### Estimating the value of pi using Monte Carlo
<svg width="200" height="200" viewbox="50 00 50 50">   <rect width="100" height="100" style="fill:hsla(180,30%,60%,.8);stroke-width:2;stroke:hsla(180,30%,10%,.8)" />  <circle cx="50" cy="50" r="50" stroke=hsla(18,30%,10%,.8) stroke-width="1" fill=hsla(20,30%,60%,.8) /></svg>

<svg    width="210mm"    height="297mm"    viewBox="0 0 210 297"    version="1.1"    id="svg5"    xmlns="http://www.w3.org/2000/svg"    xmlns:svg="http://www.w3.org/2000/svg">   <defs      id="defs2" />   <g      id="layer1">     <rect        style="fill:#3e545c;stroke:#008080;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-dashoffset:10.2047;paint-order:stroke fill markers;fill-opacity:0.76465726"        id="rect234"        width="180.02402"        height="124.59566"        x="15.493439"        y="53.036682" />     <circle        style="fill:#b91363;stroke:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-dashoffset:10.2047;paint-order:stroke fill markers;fill-opacity:1"        id="path392"        cx="77.752121"        cy="111.16313"        r="50" />     <rect        style="fill:#008000;stroke:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-dashoffset:10.2047;paint-order:stroke fill markers;fill-opacity:0.21916415"        id="rect550"        width="50"        height="50"        x="77.671928"        y="111.25816" />     <rect        style="fill:#008000;stroke:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-dashoffset:10.2047;paint-order:stroke fill markers"        id="rect660"        width="50"        height="50"        x="140.15074"        y="111.25816" />   </g> </svg>
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


# "first-visit" and "every-visit" Monte Carlo methods 

"first-visit" and "every-visit" Monte Carlo methods are two different approaches to estimating the value of states or state-action pairs.


1. **First-Visit Monte Carlo:**
- In the first-visit method, the idea is to only consider the first time a state or state-action pair is visited in a trajectory (sequence of states and actions from the start to the end of an episode).
- The value of a state or state-action pair is calculated by averaging the returns obtained only on the first visit to that state or state-action pair across all episodes.

2. **Every-Visit Monte Carlo:**
- In the every-visit method, all visits to a state or state-action pair are considered for calculating the average return.
- The value of a state or state-action pair is calculated by averaging the returns obtained on every visit to that state or state-action pair across all episodes.

**Difference in Averaging Values:**
- The key difference lies in which visits are considered when calculating the average return for a state or state-action pair.
- In first-visit Monte Carlo, each state or state-action pair is only considered once per episode, and the average is taken only over these unique visits.
- In every-visit Monte Carlo, every occurrence of a state or state-action pair is considered, and the average is taken over all visits across all episodes.

> The choice between first-visit and every-visit depends on the specific requirements of the problem. In some cases, considering only the first visit might be appropriate, while in other cases, every visit might provide a more accurate estimate of the value. The choice can also impact the convergence properties of the learning algorithm and its performance.

---
Let's consider the value estimation for a state in the context of Monte Carlo methods. The value of a state is estimated as the average return obtained when that state is visited. The formulas for first-visit and every-visit Monte Carlo are as follows:

### First-Visit Monte Carlo:

For a state \(s\):

\[ V(s) = \frac{\sum_{i=1}^{N} G_i}{N} \]

where:
- \(N\) is the number of first visits to state \(s\).
- \(G_i\) is the return obtained on the \(i\)-th first visit to state \(s\).

### Every-Visit Monte Carlo:

For a state \(s\):

\[ V(s) = \frac{\sum_{i=1}^{M} G_i}{M} \]

where:
- \(M\) is the total number of visits to state \(s\).
- \(G_i\) is the return obtained on the \(i\)-th visit to state \(s\).

### Example:

Let's consider a simple gridworld with a starting state (S), a goal state (G), and a few other states (A, B, C). The agent can move up, down, left, or right, and each move incurs a reward of -1, except when reaching the goal state, where the reward is +10. The episodes end when the goal state is reached. Here's an example grid:

```
---------------------
| S |   |   |   |   |
---------------------
| A |   | B |   |   |
---------------------
|   |   | C | G |   |
---------------------
```

Now, let's consider two episodes:

**Episode 1:**
1. Start from S.
2. Move right to A (-1).
3. Move up to B (-1).
4. Move up to C (-1).
5. Move right to G (+10).

The returns for each visit to state A during this episode are 5 and 8.

**Episode 2:**
1. Start from S.
2. Move right to A (-1).
3. Move up to B (-1).
4. Move up to C (-1).
5. Move right to G (+10).

The return for the visit to state A during this episode is 6.

Now, let's calculate the values using both first-visit and every-visit Monte Carlo:

### First-Visit Monte Carlo:

\[ V_{\text{first-visit}}(A) = \frac{5 + 6}{2} = 5.5 \]

### Every-Visit Monte Carlo:

\[ V_{\text{every-visit}}(A) = \frac{5 + 8 + 6}{3} = 6.33 \]





> The returns are the sum of rewards obtained until the end of the episode.

#### First-Visit Monte Carlo:
- Episode 1: Visits to State A - Returns: 5, 8
- Episode 2: Visits to State A - Returns: 6
- \(V_{\text{first-visit}}(A) = \frac{5 + 6}{2} = 5.5\)

#### Every-Visit Monte Carlo:
- Episode 1: Visits to State A - Returns: 5, 8
- Episode 2: Visits to State A - Returns: 6
- \(V_{\text{every-visit}}(A) = \frac{5 + 8 + 6}{3} = 6.33\)

In this example, \(V_{\text{first-visit}}(A)\) considers only the first visit in each episode, while \(V_{\text{every-visit}}(A)\) considers every visit, providing different estimates based on the averaging strategy. The actual values will depend on the specific returns obtained in each episode.

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
