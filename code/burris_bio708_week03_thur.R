

# Week03 extra exercises --------------------------------------------------

library(tidyverse)
x <- matrix(1:10, nrow = 10, ncol = 10)
x

mean(x[1,])
mean(x[2,])
mean(x[3,])
mean(x[4,])
mean(x[5,])
mean(x[6,])
mean(x[7,])
mean(x[8,])
mean(x[9,])
mean(x[10,])

rowMeans(x)


df0 <- tibble(x = 1:100, 
              y = 101:200, 
              z = rbinom(100, 10, 0.5), 
              letter = sample(letters, 100, replace = TRUE))
df0

df0 %>%
  group_by(letter) %>%
  summarize(sum_x = sum(x),
            sum_y = sum(y),
            sum_z = sum(z),
            n_obs = n())


df0 <- df0 %>% 
  pivot_wider(id_cols = "letter", # unique row ID based on
              values_from = "x", # values in each cell from
              names_from = "y") # new column names from

print(df0)


#df_na <- df0 %>%
 # mutate(x = ifelse(x < 10, NA, x),
  #       x = ifelse(y > 30, NA, y))
#df_na %>%
 # drop_na(x)





