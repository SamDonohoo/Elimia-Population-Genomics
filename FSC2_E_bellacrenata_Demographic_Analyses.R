setwd("C:/Users/pred9/Desktop/AU_PhD/Auburn Stuff/2DRad-Ebell-Ecoc/2024_Jan_Redos/FSC2/Ebellacrenata/")

library(boot)
library(ggplot2)
library(MuMIn)

####### PART 1 #######

#### Fsc27 has been run 50 times and the maximum likelihoods and associated parameters have been concatenated ####
# Read in the estimated parameters for each model
mod1 <- read.table("Ebella_Constant_Multi.bestlhoods", header = TRUE)
mod2 <- read.table("Ebella_Growth_Multi.bestlhoods", header = TRUE)
mod3 <- read.table("Ebella_Bottle1_Multi.bestlhoods", header = TRUE)
mod4 <- read.table("Ebella_Bottle1Inst_Multi.bestlhoods", header = TRUE)
mod5 <- read.table("Ebella_Bottle1Growth_Multi.bestlhoods", header = TRUE)
mod6 <- read.table("Ebella_Bottle2_Multi.bestlhoods", header = TRUE)
mod7 <- read.table("Ebella_Bottle2Inst_Multi.bestlhoods", header = TRUE)
mod8 <- read.table("Ebella_Bottle2Growth_Multi.bestlhoods", header = TRUE)

# Now find the ML run for each model
# Model 1 Steady
mod1_ml <- max(mod1$MaxEstLhood)
mod1[which(mod1$MaxEstLhood == max(mod1$MaxEstLhood)),] # Select run with best score i.e. 40
mod1[40,]$MaxEstLhood - mod1[1,]$MaxObsLhood # difference between MaxEst and MaxObs
mod1_param_no <- 1 #should be hard-coded because complex parameters are sometimes reported. Number of parameters can be found in .est files

# Model 2 Exponential Growth
mod2_ml <- max(mod2$MaxEstLhood)
mod2[which(mod2$MaxEstLhood == max(mod2$MaxEstLhood)),]
mod2[17,]$MaxEstLhood - mod2[1,]$MaxObsLhood # difference between MaxEst and MaxObs
mod2_param_no <- 3

# Model 3 Bottleneck 1
mod3_ml <- max(mod3$MaxEstLhood)
mod3[which(mod3$MaxEstLhood == max(mod3$MaxEstLhood)),]
mod3[15,]$MaxEstLhood - mod3[1,]$MaxObsLhood # difference between MaxEst and MaxObs
mod3_param_no <- 3

# Model 4 Bottleneck 1 then Instant
mod4_ml <- max(mod4$MaxEstLhood)
mod4[which(mod4$MaxEstLhood == max(mod4$MaxEstLhood)),]
mod4[42,]$MaxEstLhood - mod4[1,]$MaxObsLhood # difference between MaxEst and MaxObs
mod4_param_no <- 5

# Model 5 Bottleneck 1 then Growth 1
mod5_ml <- max(mod5$MaxEstLhood)
mod5[which(mod5$MaxEstLhood == max(mod5$MaxEstLhood)),]
mod5[18,]$MaxEstLhood - mod5[1,]$MaxObsLhood # difference between MaxEst and MaxObs
mod5_param_no <- 6

# Model 6 Bottleneck 2
mod6_ml <- max(mod6$MaxEstLhood)
mod6[which(mod6$MaxEstLhood == max(mod6$MaxEstLhood)),]
mod6[45,]$MaxEstLhood - mod6[1,]$MaxObsLhood # difference between MaxEst and MaxObs
mod6_param_no <- 5

# Model 7 Bottleneck 2 then Instant
mod7_ml <- max(mod7$MaxEstLhood)
mod7[which(mod7$MaxEstLhood == max(mod7$MaxEstLhood)),]
mod7[42,]$MaxEstLhood - mod7[1,]$MaxObsLhood # difference between MaxEst and MaxObs
mod7_param_no <- 7

# Model 8 Bottleneck 2 then Growth
mod8_ml <- max(mod8$MaxEstLhood)
mod8[which(mod8$MaxEstLhood == max(mod8$MaxEstLhood)),]
mod8[28,]$MaxEstLhood - mod8[1,]$MaxObsLhood # difference between MaxEst and MaxObs
mod8_param_no <- 8

###### Part 2 - AIC calculations ######

# Data from my models
a <- c(mod1_ml, mod2_ml, mod3_ml, mod4_ml,mod5_ml, mod6_ml, mod7_ml, mod8_ml) # MaxEstLhood. These are log10 likelihoods
aa <- c(mod1_ml, mod2_ml, mod3_ml, mod4_ml, mod5_ml, mod6_ml, mod7_ml, mod8_ml)*2.303 # Convert from log10 to ln
b <- c(mod1_param_no, mod2_param_no, mod3_param_no, mod4_param_no, mod5_param_no, 
       mod6_param_no, mod7_param_no, mod8_param_no) # Number of estimated parameters

# Calculate AIC Values
aic <- 2*b-2*aa
print(aic)

# Calculate Delta AIC to determine the Best-Fit Model
delta_aic <-(aic) - min((aic))
print(delta_aic)

# Calculate Weighted AIC to Evaluate Significance of Models.
AICw <- Weights(aic)
print(AICw)

# Calculate BIC Values
bic <- log(52)*b-2*aa
print(bic)

# Calculate Weighted BIC to Evaluate Significance of Models.
delta_bic <-(bic) - min((bic))
print(delta_bic)

###### PART 3 - 95% Confidence Intervals ######

# Read in ML and nonparametric bootstrapped parameters from exponential decline (Model 2)
bootbs <- read.table('EbellaBottle1_Bootstrapping.bestlhoods', header = TRUE) # Read in ML nonparametric bootstrapped parameters following 50 runs for each simulated SFS

# Calculate 95% confidence interval

# NANC
quantile(bootbs$NANC, c(0.025, 0.975)) # diploid - divide by 2 for true #

# NCUR
quantile(bootbs$NCUR, c(0.025, 0.975)) # diploid - divide by 2 for true #

# TCUR
quantile(bootbs$TCUR, c(0.025, 0.975))
