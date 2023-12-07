data <- Cui_etal2014

# To transform V = βL^α into a linear model, we can log both sides to make it into log(V) = αlog(L) + log(β)

log_V <- log(data$`Virion volume (nm×nm×nm)`)
log_L <- log(data$`Genome length (kb)`)

# We can now fit it to a linear model 

linear_model <- lm(log_V ~ log_L, data = data)

summary(linear_model)

# Finding α and β

# Log(β) is the intercept value 

exp(7.0748)

# β <- 1181..807 

# α is the log(L) coefficient estimate 

# α <- 1.5152

# P value associated with intercept= 6.438e-10. P value associated with gradient = 2.28e-10. We can say that the gradient and intercept are statistically significant, as the p values for both are less than 0.05.

# Code for graph

install.packages("ggplot2")
install.packages("tidyverse")
library(ggplot2)
library(tidyverse)

data %>%
ggplot(aes(x = log_L, y = log_V)) + geom_point() + geom_smooth(method = "lm") + labs(x = "log[Genome Length (kb)]", y= "log[Virion volume (nm3)]") + theme_bw()

# What is the estimated volume of a 300kb virus?

1.512*log(300) + 7.0748

# The estimated volume as worked out from inputting these numbers into the transformed formula equals 15.69892