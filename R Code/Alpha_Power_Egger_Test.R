#Egger's test for the Alpha Power Meta-Analysis.

#load libraries
library(meta)
library(dmetar)

#give in numbers
alpha_n.e <- c(27, 34, 12, 150, 25, 14, 20) #number of observations in experimental group
alpha_mean.e <- c(3.1434, 0.74, 25.06, 20919, 0.6652, 4.053, 2.643) #Estimated mean in experimental group.
alpha_sd.e <- c(0.6221, 0.68, 10.361, 14124, 0.1667, 1.0464, 0.5073) #Standard deviation in experimental group.
alpha_n.c <- c(27, 34, 12, 150, 25, 14, 20) #Number of observations in control group.
alpha_mean.c <- c(3.2097, 0.85, 27.48, 28056, 0.848, 6.8939, 3.4962) #Estimated mean in control group.
alpha_sd.c <- c(0.6221, 0.65, 16.78, 19636, 0.2046, 2.628, 0.6435) #Standard deviation in control group.
alpha_studlab <- c("Hofmann 2005", "Ehrhardt 2021", "Betti 2017", "Guo 2019", "Al-Shargie 2017", "Hafeez 2018", "Hofmann 2006") #An optional vector with study labels.

#generate meta-analysis object
alpha_meta <- metacont(alpha_n.e, alpha_mean.e, alpha_sd.e, alpha_n.c, alpha_mean.c, alpha_sd.c,
               alpha_studlab, sm = "SMD")

#Calculate Egger's Test
alpha_egger_test <- eggers.test(m1)
#Summarize Egger's Test results
summary(alpha_egger_test)
#Plot funnel plot
plot(alpha_egger_test, bg = "lightblue")

