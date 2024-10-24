install.packages("tidyverse")
install.packages("easystats")
install.packages("gtsummary")
install.packages("gt")

#load packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)


library(readxl)
data<- read_excel("raw_data/AMR_KAP_Data (3).xlsx",sheet = 2)
View(data)
#grouping knowledge level
data <- data %>% 
  mutate(Knowledge_Level = case_when (
    KnowledgePCT < 50 ~ 0,
    KnowledgePCT >= 50 & KnowledgePCT < 80 ~ 1,
    KnowledgePCT >= 80 ~ 2
  ))
#grouping attitude level
data <- data %>% 
  mutate(Attitude_Level = case_when (
    AttitudePCT < 50 ~ 0,
    AttitudePCT >= 50 & AttitudePCT < 80 ~ 1,
    AttitudePCT >= 80 ~ 2
  ))

#grouping practice level

data <- data %>% 
  mutate(Practice_Level = case_when (
    PracticePCT < 80 ~ 0,
    PracticePCT >= 80 ~ 1
  ))

install.packages("rds")
library(rds)
write_rds(data, "raw_data/AMR_KAP_Processed_1.rds")
#import data
data <- readRDS("raw_data/AMR_KAP_Processed_1.rds")
view(data)

