#TEST
library(tidyverse)

#Assignment done using my own data: "Brazil_data"
#read data in
r2=read.csv("Brazil_data.csv")
#view the data that you just read in (it is now "r2")
View(r2)

#selecting a column 
r2$participant_ID
#selecting a row
r2[1,]
#the comma needs to come first if its a column and after if its a row

#another way to select a column, in this case the 1st and 2nd column)
r2[1]
r2[2]

#get a summary of your data
summary(r2) #this gives a 6 number summary of all continuous numeric data: the minimum, the first 
# quartile (Q1), the median (Q2), the third quartile (Q3), and the maximum (Q4). It also provides the 
#class and mode of character/nominal and logistic (true/false/binomial) data

#calculation with my data: adding a column & viewing it
r2$sum_bushmeat <-  r2$turtle + r2$wild_meat
View(r2) #this allowed me to add a column indicating the total times participants ate bushmeat per year
# bushmeat=turtle and wild meat

#Use base R to aggregate your data and make a data table.  

r2$tally=1
View(r2)
f1=aggregate(tally~sum_bushmeat+fish+chicken+beef,FUN=sum,data=r2)
View(f1)
f1=aggregate(tally~sum_bushmeat+fish+chicken+beef,FUN=mean,data=r2)
View(f1)

aggregate(x = any_data, by = group_list, FUN = any_function)  # Basic R syntax of aggregate function

aggregate(x = r2,             # Mean by group
          by = list(r2$community_name),
          FUN = mean)
warnings()

#data table showing education and wealth 
tab1 <- table(r2$occupation,r2$education)
