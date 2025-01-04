# Uncomment to install BiocManager and LEA

#if (!require("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")

#BiocManager::install("LEA")

# Load BiocManager and LEA libraries

library(LEA)
library(BiocManager)

# Set working directory
setwd("C:/Users/nwhelan/My Documents/students/Donohoo/3RAD_lab-work/")

# Load data from Single SNP VCF produced by Stacks

input.file <- "Elimia_R80_maf025_Single.snps.vcf"

# Convert VCF to Geno File

E_bcNWR_Ecar <- vcf2geno(input.file, output.file = "Elimia_R80_maf025_singlesnp_LEA.geno", force = TRUE)

# Estimate admixture coefficients.
## K is the number of ancestral populations. Provide a range to estimate the best-fit K.

obj.snmf_1 = snmf(E_bcNWR_Ecar, K = 3:8, project = "new", alpha = 1, tolerance = 0.0000000001, repetitions = 10, entropy=TRUE, ploidy = 2)
obj.snmf_10 = snmf(E_bcNWR_Ecar, K = 3:8, project = "new", alpha = 10, tolerance = 0.0000000001, repetitions = 10, entropy=TRUE, ploidy = 2)
obj.snmf_100 = snmf(E_bcNWR_Ecar, K = 3:8, project = "new", alpha = 100, tolerance = 0.0000000001, repetitions = 10, entropy=TRUE, ploidy = 2)
obj.snmf_1000 = snmf(E_bcNWR_Ecar, K = 3:8, project = "new", alpha = 1000, tolerance = 0.0000000001, repetitions = 10, entropy=TRUE, ploidy = 2)
obj.snmf_10000 = snmf(E_bcNWR_Ecar, K = 3:8, project = "new", alpha = 10000, tolerance = 0.0000000001, repetitions = 10, entropy=TRUE, ploidy = 2)

# Plot the Cross Entropy score for each # of Ancestral Populations.
plot(obj.snmf_1, cex = 1.2, col = "blue", pch = 19,)
plot(obj.snmf_10, cex = 1.2, col = "blue", pch = 19,)
plot(obj.snmf_100, cex = 1.2, col = "blue", pch = 19,)
plot(obj.snmf_1000, cex = 1.2, col = "blue", pch = 19,)
plot(obj.snmf_10000, cex = 1.2, col = "blue", pch = 19,)

## Determine the best-fit run for the best fit K value.
# For this study K =5

ce5 <- cross.entropy(obj.snmf, K = 5)

best5 <- which.min(ce5)

qmatrix5 = Q(obj.snmf, K = 5, run = best5)

## Visualize the Admixture Plot

barplot(t(qmatrix5), col = c("orange", "violet", "lightgreen", "lightblue", "yellow"),
        border = "black", space = 0, xlab = "K = 5",
        ylab = "Admixture coefficients")


