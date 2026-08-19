# Predictive Customer Analytics — R Statistical Validation
# Portfolio version of the DA301 analysis completed as part of the
# LSE Data Analytics Career Accelerator.

# Packages
library(tidyverse)
library(janitor)
library(skimr)

# Load cleaned data
# Source dataset is not included in the public portfolio repository.
df <- read_csv("turtle_reviews_clean_R.csv")

# -----------------------------------------------------------------------------
# Data checks
# -----------------------------------------------------------------------------

head(df)
glimpse(df)
summary(df)
skim(df)

# -----------------------------------------------------------------------------
# Exploratory analysis
# -----------------------------------------------------------------------------

# Distribution of loyalty points
ggplot(df, aes(x = loyalty_points)) +
  geom_histogram(bins = 30) +
  labs(
    title = "Distribution of Loyalty Points",
    x = "Loyalty Points",
    y = "Frequency"
  )

# Boxplot of loyalty points
ggplot(df, aes(x = loyalty_points)) +
  geom_boxplot() +
  labs(
    title = "Boxplot of Loyalty Points",
    x = "Loyalty Points"
  )

# Spending score vs loyalty points
ggplot(df, aes(x = spending_score, y = loyalty_points)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "loess", se = FALSE) +
  labs(
    title = "Loyalty Points vs Spending Score",
    x = "Spending Score",
    y = "Loyalty Points"
  )

# Grouped summary by education and gender
df %>%
  group_by(education, gender) %>%
  summarise(
    avg_loyalty = mean(loyalty_points),
    median_loyalty = median(loyalty_points),
    sd_loyalty = sd(loyalty_points),
    count = n(),
    .groups = "drop"
  )

# Loyalty points by education and gender
ggplot(df, aes(x = education, y = loyalty_points)) +
  geom_boxplot() +
  facet_wrap(~ gender) +
  labs(
    title = "Loyalty Points by Education Level and Gender",
    x = "Education Level",
    y = "Loyalty Points"
  )

# Remuneration vs loyalty points
ggplot(df, aes(x = remuneration, y = loyalty_points)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "loess", se = FALSE) +
  labs(
    title = "Loyalty Points vs Remuneration",
    x = "Remuneration",
    y = "Loyalty Points"
  )

# -----------------------------------------------------------------------------
# Statistical diagnostics
# -----------------------------------------------------------------------------

summary(df$loyalty_points)
sd(df$loyalty_points)

# Raw loyalty-point distribution
qqnorm(df$loyalty_points, main = "Q-Q Plot of Loyalty Points")
qqline(df$loyalty_points)

shapiro.test(df$loyalty_points)

# -----------------------------------------------------------------------------
# Multiple linear regression
# -----------------------------------------------------------------------------

# Spending score, remuneration and age were selected as numeric,
# business-relevant predictors.
mlr_model <- lm(
  loyalty_points ~ spending_score + remuneration + age,
  data = df
)

summary(mlr_model)

# Residual diagnostics
qqnorm(residuals(mlr_model), main = "Q-Q Plot of MLR Model Residuals")
qqline(residuals(mlr_model))

# Actual vs predicted loyalty points
df$predicted_loyalty <- predict(mlr_model)

ggplot(df, aes(x = predicted_loyalty, y = loyalty_points)) +
  geom_point(alpha = 0.4) +
  geom_abline(slope = 1, intercept = 0, linewidth = 1) +
  labs(
    title = "Actual vs Predicted Loyalty Points",
    x = "Predicted Loyalty Points",
    y = "Actual Loyalty Points"
  ) +
  theme_minimal()

# -----------------------------------------------------------------------------
# Scenario predictions
# -----------------------------------------------------------------------------

typical_customers <- data.frame(
  spending_score = c(30, 60, 85),
  remuneration = c(30, 55, 90),
  age = c(25, 40, 55)
)

predict(mlr_model, newdata = typical_customers)

extreme_customers <- data.frame(
  spending_score = c(25, 50, 75),
  remuneration = c(25, 55, 85),
  age = c(20, 40, 60)
)

predict(mlr_model, newdata = extreme_customers)

# -----------------------------------------------------------------------------
# Interpretation
# -----------------------------------------------------------------------------

# Key findings:
# - Loyalty points are strongly right-skewed, with a small number of customers
#   accumulating disproportionately high values.
# - Spending score is the strongest behavioural driver of loyalty accumulation.
# - Remuneration is positively associated with loyalty points but is a weaker
#   driver than spending behaviour.
# - Age has comparatively limited explanatory power.
# - The final multiple linear regression model explains approximately 84% of
#   the variation in loyalty points at population level.
# - Residual diagnostics are materially better behaved than the raw target
#   distribution, although variance increases for high-value customers.
#
# Potential improvements:
# - Log transformations
# - Interaction terms
# - Segmented models for high-value customers
# - Non-linear alternatives such as decision trees or regularised regression
