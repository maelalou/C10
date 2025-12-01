library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)

# For Rinta to download csv files...
# If you are downloading csvs, please make sure that the name of the dataset is the same!
continents <- read.csv("/Users/rintaseto/Downloads/EFDS/Intro to Data Science/Mid term/data sets/continents-according-to-our-world-in-data.csv")
gdp <- read.csv("/Users/rintaseto/Downloads/EFDS/Intro to Data Science/Mid term/data sets/gdp-per-capita-worldbank.csv")
youth <- read.csv("/Users/rintaseto/Downloads/EFDS/Intro to Data Science/Mid term/data sets/youth-not-in-education-employment-training.csv")

### just to see if it gets pushed

view(continents)

# does this work?