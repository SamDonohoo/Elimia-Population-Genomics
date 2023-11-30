setwd("C:/Users/pred9/Desktop/AU_PhD/Auburn Stuff/2DRad-Ebell-Ecoc/Nov_Redos/Treemix_Redo_Nov23")

source("C:/Users/pred9/Desktop/AU_PhD/Auburn Stuff/2DRad-Ebell-Ecoc/Nov_Redos/Treemix_Redo_Nov23/nygcresearch-treemix-f38bfada3286/src/plotting_funcs.R")

# Plot the best-fit migration (i.e. 2)

plot_tree("Nov.2",pop_order="Pops.list")

# Compare Trees with Migrations 0 to 5

prefix="Nov"

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
