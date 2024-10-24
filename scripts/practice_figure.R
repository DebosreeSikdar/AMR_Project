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

library(readxl)
data <- read_excel("raw_data/AMR_KAP_Data (3).xlsx")
View(data)

#Likert items
lds <- data

#check str
glimpse(lds)

#Visualize Practice Response
Practice_df <- lds %>% 
  select(34:39) %>% 
  mutate_if(is.character,as.factor) %>%
  as.data.frame()

p2 <- plot(likert(Practice_df),
           ordered = FALSE,
           group.order =names(Practice_df))
p2 + theme_pubr()
p2

#export
ggsave("figures/Practice.tiff",units = "in", width = 12, 
       height = 6, dpi = 300, compression = 'lzw')