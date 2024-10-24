#package installation
install.packages("tidyverse")
install.packages("likert")
install.packages("ggpubr")
install.packages("ggthemes")
install.packages("RColorBrewer")

#load package
library(tidyverse)
library(likert)
library(ggpubr)
library(ggthemes)
library(RColorBrewer)

#import data
library(readxl)
data <- read_excel("raw_data/AMR_KAP_Data (3).xlsx")
View(data)


lds <- data
glimpse(lds)
#Visualize Knowledge Response
Knowledge_df <- lds %>% 
  select(12:23) %>% 
  mutate_if(is.character,as.factor) %>%
  as.data.frame()

#plot in Likert scale
p1 <- plot(likert(Knowledge_df),
           ordered = FALSE,
           group.order =names(Knowledge_df),
           center = 2)
p1 + theme_pubr()
p1
#export
ggsave("figures/Knowledge.tiff",units = "in", width = 12, 
       height = 6, dpi = 300, compression = 'lzw')
