#Egger's test for the Beta Power Meta-Analysis.

#load libraries
library(meta)
library(dmetar)

#give in numbers
beta_n.e <- c(150, 14, 24, 34, 12) #number of observations in experimental group
beta_mean.e <- c(15278.889, 3.4851, 0.06, 0.28, 17.433) #Estimated mean in experimental group.
beta_sd.e <- c(6783.695, 2.0093, 0.04, 0.7, 7.8505) #Standard deviation in experimental group.
beta_n.c <- c(150, 14, 24, 34, 12) #Number of observations in control group.
beta_mean.c <- c(8437.762, 2.2679, 0.05, 0.43, 21.24) #Estimated mean in control group.
beta_sd.c <- c(7303.15, 1.9978, 0.03, 0.75, 20.947) #Standard deviation in control group.
beta_studlab <- c("Guo 2019", "Hafeez 2018", "Perrin 2019", "Ehrhardt 2021", "Betti 2017") #An optional vector with study labels.

#generate meta-analysis object
beta_meta <- metacont(beta_n.e, beta_mean.e, beta_sd.e, beta_n.c, beta_mean.c, beta_sd.c,
                       beta_studlab, sm = "SMD")

#Calculate Egger's Test
beta_egger_test <- eggers.test(beta_meta)
#Summarize Egger's Test results
summary(beta_egger_test)
#Plot funnel plot
plot(beta_egger_test, bg = "lightblue")
