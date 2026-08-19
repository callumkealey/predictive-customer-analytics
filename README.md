# Predictive Customer Analytics

End-to-end analytics project completed as part of the LSE Data Analytics Career Accelerator. The project uses Python and R to explore customer behaviour, model loyalty-point accumulation, identify customer segments and analyse customer-review sentiment.

## Project overview

The case study focuses on how a games retailer could better understand customer engagement and improve its loyalty and marketing strategy.

The analysis addresses four questions:

- Which factors are most strongly associated with loyalty-point accumulation?
- Can customer loyalty behaviour be modelled predictively?
- Are there distinct customer segments with different behavioural profiles?
- What do customer reviews reveal about product and marketing opportunities?

## Methods

### Python

- Data cleaning, validation and exploratory analysis
- Linear regression with `statsmodels`
- Decision-tree regression with `scikit-learn`
- Train/test evaluation and model pruning
- Feature scaling and k-means clustering
- Elbow and silhouette methods for cluster selection
- NLP, tokenisation and sentiment analysis
- Data visualisation and interpretation

### R

- Exploratory data analysis with `tidyverse` and `ggplot2`
- Distribution and normality diagnostics
- Multiple linear regression
- Residual diagnostics
- Scenario-based prediction

## Key findings

- Spending behaviour was the strongest driver of loyalty-point accumulation, with remuneration also contributing materially.
- A pruned decision tree identified non-linear behavioural thresholds that complemented the regression analysis.
- K-means clustering identified five distinct customer groups based on spending and remuneration.
- Review text was broadly positive, while negative comments highlighted usability, value and instruction-related issues.
- The final multiple linear regression model explained approximately 84% of the variation in loyalty points at population level.

## Files

- [`customer_behaviour_analysis.ipynb`](customer_behaviour_analysis.ipynb) — main Python analysis notebook
- [`statistical_validation.R`](statistical_validation.R) — R statistical analysis and validation
- [`technical_report.pdf`](technical_report.pdf) — final technical report and business recommendations

## Tools

Python • pandas • NumPy • statsmodels • scikit-learn • NLTK • TextBlob • matplotlib • seaborn • R • tidyverse • ggplot2

## Portfolio note

This repository is presented as a portfolio example of my analytical workflow and problem-solving approach. The source dataset is not included.