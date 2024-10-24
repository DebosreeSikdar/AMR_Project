install.packages("tidyverse")
install.packages("likert")
install.packages("ggpubr")
install.packages("ggthemes")
install.packages("RColorBrewer")

#load packages
library(tidyverse)
library(likert)
library(ggpubr)
library(ggthemes)
library(RColorBrewer)

#import data
library(readxl)
data <- read_excel("raw_data/AMR_KAP_Data (3).xlsx")
View(data)

#Likert items
lds <- data

#check str
glimpse(lds)

#Visualize Attitude Response
Attitude_df <- lds %>% 
  select(24:33) %>% 
  mutate_if(is.character,as.factor) %>%
  as.data.frame()
#plot in Likert scale
p2 <- plot(likert(Attitude_df),
           ordered = FALSE,
           group.order =names(Attitude_df),
           center = 2)
p2 + theme_pubr()
p2

#export
ggsave("figures/Attitude.tiff",units = "in", width = 12, 
       height = 6, dpi = 300, compression = 'lzw')



