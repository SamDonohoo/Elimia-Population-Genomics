# Set working directory

setwd("C:/Users/pred9/Desktop/AU_PhD/Auburn Stuff/2DRad-Ebell-Ecoc/2024_Jan_Redos/bellacrenata")

# Load popper library

library(poppr)

# Read in data from Multiple SNPs per locus haps.gen file

bella.geneid.nout = read.genepop("Ebella_2.80.025.50_Multi.haps.gen")

# Convert genind object to a genclone object

bella.genclone.nout<-as.genclone(bella.geneid.nout)

# Amend individual names to assign them to a specific population

strata(bella.genclone.nout)<-(as.data.frame(bella.geneid.nout$pop))


##AMOVA

bella.genclone.nout
bella.genclone.nout$strata
bella.site.amova.pop = poppr.amova(bella.genclone.nout, ~bella.geneid.nout.pop, cutoff = 0.5, method = "ade4")

####Print Results

bella.site.amova.pop

##Randomization Test
bella.site.amova.pop.rtest<-randtest(bella.site.amova.pop,nrepet = 999)
bella.site.amova.pop.rtest
plot(bella.site.amova.pop.rtest)

