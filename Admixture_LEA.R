# Install BiocManager and LEA

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("LEA")

# Load BiocManager and Lea libraries

library(LEA)
library(BiocManager)

# Set working directory
setwd("C:/Users/pred9/Desktop/AU_PhD/Auburn Stuff/2DRad-Ebell-Ecoc/2024_Jan_Redos/ElimiaS_LEA/")

# Load data from Single SNP VCF produced by Stacks

input.file <- "Elimia_R80_maf025_Single.snps.vcf"

# Convert VCF to Geno File

E_bcNWR_Ecar <- vcf2geno(input.file, output.file = "Elimia_R80_maf025_singlesnp_LEA.geno", force = TRUE)

# Estimate admixture coefficients.
## K is the number of ancestral populations. Provide a range to estimate the best-fit K.

obj.snmf = snmf(E_bcNWR_Ecar, K = 1:8, project = "new",repetitions = 10, tolerance = 0.00001, entropy=TRUE, ploidy = 2)

# Plot the Cross Entropy score for each # of Ancestral Populations.
plot(obj.snmf, cex = 1.2, col = "blue", pch = 19)

## Determine the best-fit run for the best fit K value.
# For this study K =5

ce5 <- cross.entropy(obj.snmf, K = 5)

best5 <- which.min(ce5)

qmatrix5 = Q(obj.snmf, K = 5, run = best5)

## Visualize the Admixture Plot

barplot(t(qmatrix5), col = c("orange", "violet", "lightgreen", "lightblue", "yellow"),
        border = "black", space = 0, xlab = "K = 5",
        ylab = "Admixture coefficients")

View(qmatrix5)

