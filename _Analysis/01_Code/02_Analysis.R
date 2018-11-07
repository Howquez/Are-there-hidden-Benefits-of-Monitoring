# Data Manipulation -----

data$perfDiff <- data$performance - data$productivity

# Regressions
fit1 <- lm(formula = perfDiff ~ productivity, 
           data = data, 
           subset = mechanism == "performanceBased")
summary(fit1)
