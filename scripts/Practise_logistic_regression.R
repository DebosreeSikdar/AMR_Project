# load packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)

#read data
data <- readRDS("raw_data/AMR_KAP_Processed_1.rds")

# Build the multivariate logistic regression model
mv_model <- glm(Practice_Level ~ `Parent’s age (years)`+`Parent’s sex`+
                  `Parent’s education level`+`Employment status`+`Family type`+
                  `Your average household income per month (BDT)`+`Child’s sex`+
                  `Child’s sex`+ `Child’s age (years)`+ `Number of children`+
                  `Knowledge_Level`+`Attitude_Level`,
                data = data)
summary(mv_model)
report(mv_model)

# tbl_regression 
mv_model %>%  
  tbl_regression(exponentiate = TRUE)  %>%  
  modify_header(estimate = "**OR**") %>% 
  bold_p(t = 0.05)  %>%  
  as_gt()  %>%  
  gtsave("tables/Table6.docx")
