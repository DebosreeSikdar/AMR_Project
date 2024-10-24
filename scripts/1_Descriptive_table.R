install.packages("tidyverse")
install.packages("gtsummary")
install.packages("gt")
#load packages
library(tidyverse)
library(gtsummary)
library(gt)
#import data
data<-readRDS("raw_data/AMR_KAP_Data(3)_processed.rds")
view(data)

#demographic characteristics of study participant
data %>%
  select(1:11) %>% 
  tbl_summary(
    statistic = list(
      all_continuous()~ "{mean}±{sd}"
    )
  )%>% 
  as_gt() %>% 
  gtsave("tables/Table1.docx")

#table:2.Major sources of information about antibiotic parents
data %>% 
  select(47:55) %>% 
  tbl_summary() %>% 
  as_gt() %>% 
  gtsave("tables/Table2.docx")

#table.3: Level of knowledge, attitudes, and practices towards antibiotic resistance 

data %>%
  select(69:71) %>% 
  tbl_summary() %>% 
  as_gt() %>% 
  gtsave("tables/Table3.docx")


