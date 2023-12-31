# What is hypothesis
A hypothesis is a *testable statement* or proposition that serves as the basis for scientific inquiry. It is a way for researchers to make predictions about the relationship between variables or to make statements about the characteristics of a population. 
In a research study, there are typically two types of hypotheses: the null hypothesis (H0) and the alternative hypothesis (H1 or Ha).
1. **Null Hypothesis (H0):** The null hypothesis is a statement of no effect or no difference. It suggests that there is no relationship between the variables being studied, or there is no effect of a treatment or intervention. Researchers often aim to test the null hypothesis to determine if there is enough evidence to reject it.
2. **Alternative Hypothesis (H1 or Ha):** The alternative hypothesis is the opposite of the null hypothesis. It suggests that there is a relationship between variables or an effect of a treatment or intervention. Researchers are often interested in supporting the alternative hypothesis, as it implies that there is a meaningful result.
3. **Research Hypothesis:** This term is often used interchangeably with the alternative hypothesis. The research hypothesis is the specific statement that researchers are trying to support or demonstrate through their study.
---
# Why Test Hypotheses:
- **Scientific Inquiry:** Testing hypotheses is fundamental to the scientific method. It allows researchers to systematically investigate and understand phenomena in the world.
- **Evidence-Based Decision Making:** Testing hypotheses provides a systematic and structured approach to decision-making, especially in fields like medicine, psychology, and social sciences.
- **Building Knowledge:** By testing hypotheses, researchers contribute to the cumulative body of knowledge in their respective fields.
---
# How to Test Hypotheses:
1. **Formulate Hypotheses:** Clearly state the null hypothesis (H0) and the alternative hypothesis (H1 or Ha) based on the research question.
2. **Design the Study:** Develop a research design and methodology that allows for the collection of relevant data to test the hypotheses.
3. **Collect Data:** Gather data through experiments, observations, surveys, or other appropriate methods.
4. **Data Analysis:** Use statistical methods to analyze the collected data. Common statistical tests include *z-test*, *t-tests*, *chi-square tests*, *ANOVA*, *regression analysis*, etc.
5. **Draw Conclusions:** Based on the analysis, make conclusions about whether there is enough evidence to reject the null hypothesis in favor of the alternative hypothesis.
6. **Report Findings:** Communicate the results of the hypothesis test in a clear and transparent manner, often including statistical measures of significance.
It's important to note that *statistical significance* does not prove the truth of a hypothesis but provides evidence against the null hypothesis. 
---
# Rules for writing H0 and H1 using $=, \leq, \geq$:
#### H0 (Null Hypothesis):
- Always uses an equal symbol ($=$).
- Represents the status quo, the default assumption, or the hypothesis you aim to disprove.
#### H1 (Alternative Hypothesis):
- Never uses an equal symbol ($=$).
- Represents the alternative to the null hypothesis, the claim you want to support with evidence.
- Uses inequality symbols ($<$, $>$, $\leq$, $\geq$, $\neq$) depending on the direction of the claim.
#### Example 1:
- **H0:** The average weight of a newborn baby is 7 pounds.
* **H1:** The average weight of a newborn baby is **not** 7 pounds. (This can be written as H1: The average weight of a newborn baby is $< 7$ pounds, $> 7$ pounds, or $\geq$ 7 pounds)
#### Example 2:
- **H0:** The temperature is 70°F.
* **H1:** The temperature is **higher than** 70°F. (H1: The temperature is > 70°F)
#### Example 3:
- **H0:** The proportion of students who like chocolate ice cream is 0.5.
* **H1:** The proportion of students who like chocolate ice cream is **greater than** 0.5. (H1: The proportion of students who like chocolate ice cream is > 0.5)
#### Rule for using $=$ with H0:
- The equal symbol ($=$) always appears in the null hypothesis (H0) because it represents the statement that there is **no difference** between the two things being compared.
#### Using inequality symbols with H1:
- The choice of inequality symbol ($<$, $>$, $\leq$, $\geq$, $\neq$) in H1 depends on the specific claim you are making.
- Use $>$ or $<$ when the claim implies a direction (higher, lower).
- Use $\leq$ or $\geq$$ when the claim includes the possibility of equality.
- Use $\neq$ when the claim is for anything other than equality.
---
# Type I error and Type II error in Hypothesis testing
### Type I Error:
H0 is correct but H1 is accepted (H0 is rejected).
###### Definition: 
A Type I error occurs when the null hypothesis (H0) is incorrectly rejected when it is actually true. It is also known as a "*false positive*" or an "*alpha error*."  
###### Symbol:
Denoted by the Greek letter \(\alpha\) (alpha).  
###### Probability of Type I Error:
The probability of making a Type I error is equal to the chosen level of significance (\(\alpha\)), which is the probability of rejecting a true null hypothesis.  
###### Example:
Suppose a medical test claims to detect a specific disease, and a Type I error would occur if a healthy person is incorrectly diagnosed as having the disease.  
### Type II Error:
H0 is incorrect but H1 is rejected (H0 is not rejected).
###### Definition:
A Type II error occurs when the null hypothesis (H0) is incorrectly not rejected when it is actually false. It is also known as a "*false negative*" or a "*beta error*."  
###### Symbol:
Denoted by the Greek letter \(\beta\) (beta).  
###### Probability of Type II Error:
The probability of making a Type II error is influenced by factors such as sample size, effect size, and the chosen level of significance. It is also influenced by the power of the statistical test.  
###### Example:
Continuing with the medical test example, a Type II error would occur if a person with the disease is incorrectly identified as not having the disease.  
---
# Relationship Between Type I and Type II Errors:
> There is a trade-off between Type I and Type II errors. As you decrease the probability of one type of error, the probability of the other type of error typically increases.
> The level of significance (\(\alpha\)) chosen in hypothesis testing directly affects the likelihood of a Type I error. Lowering \(\alpha\) reduces the chance of Type I error but increases the risk of Type II error.
### Summary:
- **Type I Error (False Positive):** Rejecting a true null hypothesis.
- **Type II Error (False Negative):** Not rejecting a false null hypothesis.
---
# Z-Score:
A Z-score (or standard score) is a measure of how many standard deviations a particular data point is from the mean of a distribution. It's a way to standardize scores and compare them across different scales. The formula for calculating the Z-score of an individual data point (X) in a distribution with a mean (μ) and standard deviation (σ) is:
\[ Z = \frac{{X - \mu}}{{\sigma}} \]
The Z-score indicates whether a data point is above (positive Z-score) or below (negative Z-score) the mean and by how many standard deviations. Z-scores are often used to identify outliers or to compare scores from different distributions.
---
# Z-Test:
A Z-test is a statistical test used to determine if there is a significant difference between a sample mean and a known population mean. It is particularly useful when the population standard deviation \(\sigma\) is known. There are two main types of Z-tests: one-sample Z-test and two-sample Z-test.
### One-Sample Z-Test:
##### Use:
Used when comparing the mean of a single sample to a known population mean.
##### Hypotheses:
*   Null Hypothesis (H0): \( \mu = \mu_0 \) (No significant difference)
*   Alternative Hypothesis (H1): \( \mu \neq \mu_0 \) (Significant difference)
##### Formula:
\[ Z = \frac{{\bar{X} - \mu_0}}{{\frac{\sigma}{\sqrt{n}}}} \]
##### Decision Rule:
Compare the calculated Z-value to the critical Z-value based on the chosen level of significance.
### Two-Sample Z-Test:
##### Use:
Used when comparing the means of two independent samples.
##### Hypotheses:
*  Null Hypothesis (H0): \( \mu_1 = \mu_2 \) (No significant difference)
*   Alternative Hypothesis (H1): \( \mu_1 \neq \mu_2 \) (Significant difference)
##### Formula:
$$ Z = \frac{{\bar{X_1} - \bar{X_2}}}{{\sqrt{\frac{{\sigma_1^2}}{{n_1}} + \frac{{\sigma_2^2}}{{n_2}}}}} $$
##### Decision Rule:
Compare the calculated Z-value to the critical Z-value based on the chosen level of significance.
---
> **Z-Score:** Measures the standard deviation distance of a data point from the mean in a distribution.
> **Z-Test:** A statistical test used to assess if there is a significant difference between a sample mean and a known population mean, assuming a known population standard deviation.
The Z-test is commonly used in hypothesis testing when dealing with *large sample sizes ($n>30$)*  or *when the population standard deviation is known*. If the population standard deviation is unknown or the sample size is small, the t-test may be more appropriate.
---
# t-test
A t-test is a statistical test used to compare the means of two groups and determine if there is a significant difference between them. The t-test is particularly useful when dealing with *small sample sizes ($\leq30$)* and *situations where the population standard deviation is unknown*. There are several types of t-tests, but the two most common ones are the independent samples t-test and the paired samples t-test.
### Independent Samples T-Test:
The independent samples t-test is used when comparing the means of two independent groups to determine if the observed differences are statistically significant. The assumptions for this test include normal distribution of data and approximately equal variances between the groups.
#### Formulas:
- **Test Statistic (t):**
\[ t = \frac{{\bar{X}_1 - \bar{X}_2}}{{\sqrt{\frac{{s_1^2}}{{n_1}} + \frac{{s_2^2}}{{n_2}}}}} \]
- **Degrees of Freedom (df):**
\[ df = n_1 + n_2 - 2 \]
#### Hypotheses:
- Null Hypothesis (H0): \( \mu_1 = \mu_2 \) (No significant difference)
- Alternative Hypothesis (H1): \( \mu_1 \neq \mu_2 \) (Significant difference)
### Paired Samples T-Test:
The paired samples t-test is used when comparing the means of two related groups, such as before and after measurements on the same subjects. It is designed to assess whether the mean difference between paired observations is significantly different from zero.
#### Formulas:
- **Test Statistic (t):**
\[ t = \frac{{\bar{d}}}{{\frac{{s_d}}{{\sqrt{n}}}}} \]
- **Degrees of Freedom (df):**
\[ df = n - 1 \]
#### Hypotheses:
- Null Hypothesis (H0): \( \mu_d = 0 \) (No significant difference)
- Alternative Hypothesis (H1): \( \mu_d \neq 0 \) (Significant difference)
### Steps for Conducting a T-Test:
1. **Formulate Hypotheses:** Clearly state the null and alternative hypotheses based on the research question.
2. **Collect Data:** Obtain data from the two groups or conditions being compared.
3. **Calculate Test Statistic:** Use the appropriate formula to compute the t-statistic.
4. **Determine Degrees of Freedom:** Calculate the degrees of freedom based on the sample sizes.
5. **Find Critical Value or P-Value:** Depending on the research design, use a t-table or statistical software to find the critical t-value or calculate the p-value.
6. **Make a Decision:** Compare the calculated t-statistic to the critical value or compare the p-value to the chosen level of significance (usually 0.05).
7. **Draw Conclusions:** Based on the results, either reject or fail to reject the null hypothesis.
> T-tests are widely used in various fields, including psychology, biology, and social sciences, to compare means and assess the significance of observed differences.
---
# p-value and level of significance ($\alpha$)
The p-value and level of significance are crucial concepts in statistical hypothesis testing. 
> They help researchers make decisions about whether to reject or fail to reject the null hypothesis based on the evidence provided by the data.
---
# p-Value:
The p-value is a probability that quantifies the evidence against a null hypothesis. It represents the probability of observing a test statistic as extreme as, or more extreme than, the one calculated from the sample data, assuming the null hypothesis is true. In other words, a small p-value suggests that the observed data is unlikely under the assumption that the null hypothesis is true, leading to the rejection of the null hypothesis.
#### Interpretation of P-Value:
- A small p-value (typically less than 0.05) is often interpreted as evidence to reject the null hypothesis.
- A larger p-value suggests that the data is consistent with the null hypothesis, and there is not enough evidence to reject it.
---
### Level of Significance (Alpha, $\alpha$):
The level of significance, denoted by the symbol \(\alpha\) (alpha), is the predetermined threshold used to make decisions in hypothesis testing. It represents the probability of committing a Type I error, which is the error of rejecting a true null hypothesis. Commonly used levels of significance are 0.05, 0.01, and 0.10.
#### Interpretation of Level of Significance:
- A significance level of 0.05 (5%) is commonly used in many fields. This means that if the p-value is less than 0.05, the null hypothesis is rejected. *A significance level of 0.05 is often considered a standard in many fields, representing a 5% chance of committing a Type I error*.
- A smaller significance level (e.g., 0.01) is used when a higher standard of evidence is required before rejecting the null hypothesis.
- A larger significance level (e.g., 0.10) is used when a lower standard of evidence is acceptable.
---
# Decision Rule:
- If the p-value is less than or equal to the level of significance (p ≤ \(\alpha\)), the null hypothesis is rejected.
- If the p-value is greater than the level of significance (p > \(\alpha\)), there is insufficient evidence to reject the null hypothesis.
### Example:
Suppose you conduct a t-test with a significance level of 0.05. If the calculated p-value is 0.03, you would compare it to the significance level. Since 0.03 is less than 0.05, you would reject the null hypothesis, indicating that there is evidence to suggest a significant effect or difference.
It's essential to choose an appropriate level of significance based on the goals of the study and the consequences of making Type I errors. Researchers often use 0.05 as a default level, but it's important to consider the context and consequences of the decision.
---
### Level of Significance (\(\alpha\)):
The choice of the level of significance, denoted by \(\alpha\) (alpha), is somewhat arbitrary and depends on the goals of the study and the consequences of making Type I errors. Here are some considerations:
#### 1. Commonly Used Levels:
-  The most common levels of significance are 0.05, 0.01, and 0.10.
-  A significance level of 0.05 is often considered a standard in many fields, representing a 5% chance of committing a Type I error.
#### 2. Context and Consequences:
-  Consider the context of the study and the impact of making a Type I error (rejecting a true null hypothesis).
-  If the consequences of a Type I error are severe, a lower significance level (e.g., 0.01) may be chosen for a higher level of confidence.
#### 3. Research Standards:
-  Some fields or research areas may have established conventions for the level of significance based on historical practices and standards.
#### 4. Multiple Testing Adjustments:
-  When conducting multiple tests on the same data set, researchers may use Bonferroni correction or other adjustments to control the overall Type I error rate.
---
### P-Value Calculation:
The p-value is a measure of evidence against a null hypothesis. Its calculation depends on the statistical test used and the specific hypothesis being tested. Here are general steps for calculating the p-value:
##### 1 **Select a Statistical Test:**
Choose an appropriate statistical test based on the research question and the nature of the data (e.g., t-test, chi-square test, ANOVA).
##### 2 **Determine the Null Hypothesis:**
Formulate the null hypothesis (H0) and the alternative hypothesis (H1).
##### 3 **Collect and Analyze Data:**
Collect relevant data and perform the chosen statistical analysis. The output of the analysis will include a test statistic.
##### 4 **Calculate the Test Statistic:**
Use the formula associated with the chosen statistical test to compute the test statistic.
##### 5 **Determine the Probability:**
Use the test statistic to determine the probability (p-value) of observing a test statistic as extreme as, or more extreme than, the one calculated, assuming the null hypothesis is true.
##### 6 **Compare to Level of Significance:**
Compare the calculated p-value to the chosen level of significance (\(\alpha\)).
If \( p \leq \alpha \), reject the null hypothesis.
If \( p > \alpha \), fail to reject the null hypothesis.
### Example:
Suppose you conduct a t-test to compare the means of two groups. After performing the analysis, you obtain a t-statistic and degrees of freedom. You then use a t-distribution table or statistical software to find the p-value associated with the observed t-statistic.
If the calculated p-value is 0.03 and your chosen level of significance is 0.05, you would compare the p-value to the level of significance. Since 0.03 is less than 0.05, you would reject the null hypothesis at the 0.05 level of significance.
---
# Question
A Restaurant having average sales of 500 tea cups per day. Because of the development of bus stand nearby, it expects to increase its sales. During the first 12 days after the start of the bus stand, the daily sales were as under:
`550, 570, 490, 615, 505, 580, 570, 460, 600, 580, 530, 526`
On the basis of this sample information, can one conclude that the Restaurant’s sales have increased? Use $5%$ level of significance and the value of $t$ from t-distribution table for 11 degrees of freedom is  $t = 1.796$
## Hints: 
To determine if the restaurant's sales have increased significantly after the development of the bus stand, you can perform a t-test for the mean of a sample. The null hypothesis (H0) is that there is no increase in sales, and the alternative hypothesis (H1) is that there is an increase in sales.
Here are the steps for the solution:
#### 1. **Calculate the sample mean (x̄) and sample standard deviation (s):**
\[ x̄ = \frac{1}{n} \sum_{i=1}^{n} x_i \]
\[ s = \sqrt{\frac{1}{n-1} \sum_{i=1}^{n} (x_i - x̄)^2} \]
Using the provided data:
\[ x̄ = \frac{550 + 570 + \ldots + 526}{12} \]
\[ s = \sqrt{\frac{(550 - x̄)^2 + (570 - x̄)^2 + \ldots + (526 - x̄)^2}{11}} \]
#### 2. **Calculate the standard error (SE):**
\[ SE = \frac{s}{\sqrt{n}} \]
Where \( n \) is the sample size.
#### 3. **Calculate the t-statistic:**
\[ t = \frac{x̄ - \text{Population mean under } H0}{SE} \]
Population mean under \( H0 \) is the hypothesized mean under the null hypothesis, which is 500 tea cups per day.
#### 4. **Compare the t-statistic to the critical t-value:**
- Given \( t_{\text{critical}} = 1.796 \) (from the t-distribution table for 11 degrees of freedom) at a 5% significance level.
- If \( |t| > t_{\text{critical}} \), reject the null hypothesis.
#### 5. **Draw a conclusion:**
- If the null hypothesis is rejected, it suggests that there is a significant increase in sales.
Let's perform these calculations:
\[ x̄ = \frac{550 + 570 + \ldots + 526}{12} \]
\[ s = \sqrt{\frac{(550 - x̄)^2 + (570 - x̄)^2 + \ldots + (526 - x̄)^2}{11}} \]
\[ SE = \frac{s}{\sqrt{12}} \]
\[ t = \frac{x̄ - 500}{SE} \]
Now, compare \( |t| \) with \( t_{\text{critical}} \) and draw a conclusion.
---
# References
## How to read p values from z and t tables
- [Calculating a P-value given a z statistic ](https://www.youtube.com/watch?v=NNpv-n_Hbvc) 
- [Using a table to estimate P-value from t statistic](https://www.youtube.com/watch?v=z-HSsVARNnk) 
- [Using the t Table to Find the P-value in One-Sample t Tests](https://www.youtube.com/watch?v=tI6mdx3s0zk) 
