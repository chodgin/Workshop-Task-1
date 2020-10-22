file <-  "chaff.txt"
file <- chaff
chaff <- chaff

library(tidyverse)

write.table(chaff, 
            file, 
            quote = FALSE,
            row.names = FALSE)
chaff<- chaff%>% 
  pivot_longer(names_to = "sex", 
               values_to = "mass",
               cols = everything())

chaff %>% group_by(sex) %>%
  summarise(mean = mean(mass),
            n = length(mass),
            sd = sd(mass))

units <- "in"  
fig_w <- 3.5
fig_h <- fig_w
dpi <- 300
device <- "tiff" 


fig1 <- chaff %>% ggplot(aes(mass = sex, y = mass)) +
  geom_boxplot()

fig1 <- ggplot(data = chaff, aes( x = sex, y = mass)) +
  geom_boxplot()

ggsave("Figures/fig1.tiff",
       plot = fig1,
       device = device,
       width = fig_w,
       height = fig_h,
       units = units,
       dpi = dpi)

getwd()
