# Predictive Customer Analytics

End-to-end customer analytics project completed as part of the LSE Data Analytics Career Accelerator. The analysis uses Python and R to explore customer behaviour, model loyalty-point accumulation, identify customer segments and analyse review sentiment.

## Business problem

The case study focuses on how a games retailer could better understand customer engagement and improve its loyalty and marketing strategy. The analysis examines:

- which factors are associated with loyalty-point accumulation
- whether customer behaviour can be modelled predictively
- whether distinct customer segments can be identified
- what customer reviews reveal about product and marketing opportunities

## Analytical approach

### Python

- Data cleaning, validation and exploratory analysis
- Linear regression using `statsmodels`
- Decision-tree regression using `scikit-learn`
- Model evaluation and pruning
- Feature scaling and k-means clustering
- Elbow and silhouette methods for cluster selection
- NLP, tokenisation and sentiment analysis
- Data visualisation and business interpretation

### R

- Exploratory analysis and visualisation with `tidyverse` and `ggplot2`
- Distribution diagnostics
- Multiple linear regression
- Residual checks and scenario-based prediction

## Key findings

- Spending behaviour was the strongest driver of loyalty-point accumulation, with remuneration also contributing to the result.
- A pruned decision tree highlighted non-linear behavioural thresholds that complemented the regression analysis.
- K-means clustering identified five distinct customer groups based on spending and remuneration.
- Review text was broadly positive, while negative comments highlighted usability, value and instruction-related issues.
- The final multiple linear regression model explained approximately 84% of the variation in loyalty points at population level.

## Repository structure

- `notebooks/` – Python analysis notebook
- `r/` – R statistical analysis and validation
- `report/` – final technical report

## Tools

Python • pandas • NumPy • statsmodels • scikit-learn • NLTK • TextBlob • matplotlib • seaborn • R • tidyverse • ggplot2

## Note

This repository is presented as a portfolio example of my analytical workflow and problem-solving approach. The source dataset is not included.