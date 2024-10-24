#load packages
library(tidyverse)
install.packages("readxl")
library(readxl)
library(readxl)
data <- read_excel("raw_data/AMR_KAP_Data (3).xlsx",sheet=2)
View(data)
install.packages("naniar")
library(naniar)
sum(is.na(data))
miss_var_summary(data)
gg_miss_var(data)
install.packages("gapminder")
library(gapminder)
data_new<-drop_na(data)
dim(data_new)
dim(data)

#knowledge level grouping
data1 <- data_new |>
  mutate(Knowledge_Level = case_when (
    KnowledgePCT < 50 ~ "Poor",
    KnowledgePCT >= 50 & KnowledgePCT < 80 ~ "Moderate",
    KnowledgePCT >= 80 ~ "Good"
  ))
#attitude level grouping
#attitude level grouping
data1 <- data_new %>% 
  mutate(Attitude_Level = case_when (
    AttitudePCT < 50 ~ "Negative",
    AttitudePCT >= 50 & AttitudePCT < 80 ~ "Uncertain",
    AttitudePCT >= 80 ~ "Positive"
  ))
#practice level grouping

data1 <- data_new %>% 
  mutate(Practice_Level = case_when (
    PracticePCT < 80 ~ "inappropriate",
    PracticePCT >= 80 ~ "appropriate"
  ))
view(data1)
data2<-write.csv(data1,"raw_data/AMR_KAP_Data (3)_Processed.csv", row.names = F)
view(data2)
`AMR_KAP_Data(3)_Processed1` <- readRDS("C:/Users/Suranjana/Desktop/Chiral/AMR_Project/raw_data/AMR_KAP_Data(3)_Processed.rds")

