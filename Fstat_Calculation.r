library(vegan)
library(hierfstat)
library(ggplot2)
library(ecodist)
library(adegenet)
rm(list=ls())
setwd("~/students/Donohoo/3RAD_lab-work/")


##Generate Pairwise Fst

#Note: this was done with the multiple SNP per dataset haps file, which I think is the most robust way to calculate Fst.
genepops<-list.files(pattern="*.genepop")
gens<-gsub(".genepop$",".gen", genepops)
file.rename(genepops,gens)

## Calculate Weir and Cockerham Fst
dat<-read.genepop("Elimia_R80_maf025_Multi.haps.gen")##Read in Genepop
data2<-genind2hierfstat(dat)
data2$pop #Sanity check to make sure populations are accurately defined.
WC<-pairwise.WCfst(data2,diploid = TRUE)
WC[is.na(WC)]<-0
write.table(WC,file="WC_FST.csv",row.names=TRUE, col.names = NA, sep = ",")
WC<-as.dist(WC)
WC

## Run Bootstrapping to Evaluate Significance
# P-value of 0.05
Boot <- boot.ppfst(dat=data2,nboot=1000,quant=c(0.025,0.975),diploid=TRUE)
Boot[is.na(Boot)]<-0
print(Boot)

# P-value 0f 0.01
Boot.01 <- boot.ppfst(dat=data2,nboot=1000,quant=c(0.005,0.995),diploid=TRUE)
Boot.01[is.na(Boot.01)]<-0
print(Boot.01)

# P-value of 0.001
Boot.001 <- boot.ppfst(dat=data2,nboot=1000,quant=c(0.0005,0.9995),diploid=TRUE)
Boot.001[is.na(Boot.001)]<-0
print(Boot.001)
