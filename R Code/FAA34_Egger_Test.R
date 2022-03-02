#Egger's test for the FAA Meta-Analysis.

#load libraries
library(meta)
library(dmetar)

#give in numbERS
FAA_n.e <- c(49, 9, 38, 40, 70, 27, 25, 18) #number of observations in experimental group
FAA_mean.e <- c(0.082, 0.0699, 0.058, 0.0, -0.01, 0.1101, -0.07, -0.16) #Estimated mean in experimental group.
FAA_sd.e <- c(0.211, 0.0363, 0.515, 0.17, 0.1422, 0.1043, 0.2, 0.0294) #Standard deviation in experimental group.
FAA_n.c <- c(49, 9, 38, 40, 70, 27, 25, 18) #Number of observations in control group.
FAA_mean.c <- c(0.021, 0.063, 0.009, -0.03, -0.024, 0.1298, 0.02, -0.0967) #Estimated mean in control group.
FAA_sd.c <- c(0.149, 0.0597, 0.158, 0.33, 0.1506, 0.051, 0.21, 0.1287) #Standard deviation in control group.
FAA_studlab <- c("Düsing 2016", "Brouwer 2011", "Pérez-Edgar 2013", "Peterson 2011", "Quaedflieg 2015", "Hofmann 2005", "Wang 2015", "Al-Shargie 2017") #An optional vector with study labels.

#generate meta-analysis object
FAA_meta <- metacont(FAA_n.e, FAA_mean.e, FAA_sd.e, FAA_n.c, FAA_mean.c, FAA_sd.c,
                      FAA_studlab, sm = "SMD")

#Calculate Egger's Test
FAA_egger_test <- eggers.test(FAA_meta)
#Summarize Egger's Test results
summary(FAA_egger_test)
#Plot funnel plot
plot(FAA_egger_test, bg = "lightblue")
