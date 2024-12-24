# R course for beginners
# Week 1
# assignment by Amir Mano, id 205779788

# create variables
sub_id <- seq(1,6)
sex <- sample(c('m','f'),length(sub_id),replace=T, prob = c(0.5, 0.5))
age <- runif(length(sub_id), 15, 40)
has_depression <- rbinom(length(sub_id),1,0.083) #according to USA in 2021

# create data frame
df <- data.frame(sub_id, sex, age, has_depression)

# save data frame
write.csv(df, 'HW_1.csv')