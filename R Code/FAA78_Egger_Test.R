#Egger's test for the FAA Meta-Analysis.

#load libraries
library(meta)
library(dmetar)

#give in numbERS
FAA_n.e <- c(9, 49, 70, 43, 40, 18, 25, 19) #number of observations in experimental group
FAA_mean.e <- c(0.1453, 0.054, -0.159, 0.06, -0.04, -0.1203, -0.09, -0.0034) #Estimated mean in experimental group.
FAA_sd.e <- c(0.0918, 0.194, 0.2845, 0.78, 0.26, 0.0404, 0.14, 0.1872) #Standard deviation in experimental group.
FAA_n.c <- c(9, 49, 70, 43, 40, 18, 25, 19) #Number of observations in control group.
FAA_mean.c <- c(0.1053, 0.027, -0.186, 0.0, -0.04, -0.1033, -0.05, 0.0613) #Estimated mean in control group.
FAA_sd.c <- c(0.0567, 0.21, 0.3096, 0.77, 0.34, 0.1278, 0.19, 0.1719) #Standard deviation in control group.
FAA_studlab <- c("Brouwer 2011","Düsing 2016","Quaedflieg 2015","Verona 2009","Peterson 2011","Al-Shargie 2017","Wang 2015","Kawamoto 2013") #An optional vector with study labels.

#generate meta-analysis object
FAA_meta <- metacont(FAA_n.e, FAA_mean.e, FAA_sd.e, FAA_n.c, FAA_mean.c, FAA_sd.c,
                     FAA_studlab, sm = "SMD")

#Calculate Egger's Test
FAA_egger_test <- eggers.test(FAA_meta)
#Summarize Egger's Test results
summary(FAA_egger_test)
#Plot funnel plot
plot(FAA_egger_test, bg = "lightblue")
