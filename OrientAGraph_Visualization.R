setwd("C:/Users/pred9/Desktop/AU_PhD/Auburn Stuff/2DRad-Ebell-Ecoc/2024_Jan_Redos/OrientAGraph/")

library(ggplot2)

source("C:/Users/pred9/Desktop/AU_PhD/Auburn Stuff/2DRad-Ebell-Ecoc/Nov_Redos/Treemix_Redo_Nov23/nygcresearch-treemix-f38bfada3286/src/plotting_funcs.R")

# Graph the likelihood values for each number of migrations

Lik <- c(0,38.6272,86.7555,89.638,89.638,89.638)
Mig <- c(0:5)

plot(x = Mig, y = Lik, col = "Blue", pch = 16, cex = 1.25, xlab = "Migrations", ylab = "ln(likelihood)", type="b")

# Plot the best-fit migration (i.e. 2)

plot_tree("Treemix_Take1.0")
plot_tree(cex=0.8,paste0(Treemix_Take1.,edge))

# Compare Trees with Migrations 0 to 5

prefix="Treemix_Take1"

library(RColorBrewer)

library(R.utils)

par(mfrow=c(2,3))
for(edge in 0:5){
  plot_tree(cex=0.8,paste0(prefix,".",edge))
  title(paste(edge,"edges"))
}

# Compare Covariances with Migrations 0 to 5

for(edge in 0:5){
  plot_resid(stem=paste0(prefix,".",edge),pop_order="Pops.list")
}
