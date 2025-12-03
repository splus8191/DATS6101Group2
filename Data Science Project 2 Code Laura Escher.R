# Data Science Project 2
library(ggplot2)
library(dplyr)
library(modelsummary)

airdata <- read.csv("C:/Users/esche_zla0rp6/OneDrive - The George Washington University/Intro to Data Science/Data Science Project 2/sample airline data.csv")

major <- c('DL', 'WN', 'B6', 'UA', 'AA', 'G4', 'F9', 'HA', 'AS')

airlinename <- data.frame(
  OP_UNIQUE_CARRIER = c('DL', 'WN', 'B6', 'UA', 'AA', 'G4', 'F9', 'HA', 'AS'),
  airline = c('Delta', 'Southwest', 'JetBlue', 'United', 'American', 'Allegiant',
              'Frontier', 'Hawaiian', 'Alaska')
)

majorairline <- airdata %>%
  filter(OP_UNIQUE_CARRIER %in% major)

str(majorairline)
airdata$OP_UNIQUE_CARRIER <- as.factor(airdata$OP_UNIQUE_CARRIER)

majorairline %>%
  count(OP_UNIQUE_CARRIER)

finalairline <- majorairline %>%
  left_join(airlinename, by = "OP_UNIQUE_CARRIER")

summary(majorairline)

#colnames(majorairline)
datasummary_correlation(majorairline)

ggplot(finalairline, aes(x = airline, y = WEATHER_DELAY)) +
  geom_boxplot() +
  labs(
    title = "Delay Minutes by Airline and Weather Delay",
    x = "Airline",
    y = "Delay (minutes)"
  ) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5))


