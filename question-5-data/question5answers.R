data <- Cui_etal2014

# to transform V = βL^α into a linear model, we can log both sides to make it into log(V) = αlog(L) + log(β)

log_V <- log(data$`Virion volume (nm×nm×nm)`)
log_L <- log(data$`Genome length (kb)`)

# we can now fit it to a linear model 

linear_model <- lm(log_V ~ log_L, data = data)

summary(linear_model)

# finding α and β

# log(β) is the intercept value 

exp(7.0748)

# β <- 1181..807 

# α is the log(L) coefficient estimate 

# α <- 1.5152

# p value: 6.438e-10 < 0.05. We can say that the p value is statistically significant, as it's less than 0.05.

# code for graph

install.packages("ggplot2")
install.packages("tidyverse")
library(ggplot2)
library(tidyverse)

data %>%
ggplot(aes(x = log_L, y = log_V)) + geom_point() + geom_smooth(method = "lm") + labs(x = "log[Genome Length (kb)]", y= "log[Virion volume (nm3)]") + theme

# what is the estimated volume of a 300kb virus?

1.512*log(300) + 7.0748

# the estimated volume as worked out from inputting these numbers into the transformed formula equals 15.69892