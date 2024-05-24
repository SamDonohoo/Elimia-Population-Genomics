# Set working Directory
setwd("C:/Users/pred9/Desktop/AU_PhD/Auburn Stuff/2DRad-Ebell-Ecoc/2024_Jan_Redos/bellacrenata")

# Link Bayescan R Scripts
source("R functions/plot_R.r", chdir = TRUE)

# Load packages
library(boa)

# Visualize Bayescan Output for FST

Ebella_Results<- plot_bayescan("Ebellacrenata_Bayescan_Output_fst.txt", FDR=0.05)

#Determine if any Loci are Under Selection.

Ebella_Results$outliers
Ebella_Results$nb_outliers

## Plotting Posterior Distribution

# Load in data from Bayescan Output

mydata=read.table("Ebellacrenata_Bayescan_Output.sel",colClasses="numeric")

# Set parameter of interest: Population Specific FST

parameter="Fst1"

# Visualize Posterior Distribution

plot(density(mydata[[parameter]]), xlab=parameter, main=paste(parameter,"posterior distribution"))

# Calculate Highest Probability Density Interval (HPDI) for your parameter of interest

boa.hpd(mydata[[parameter]],0.05)