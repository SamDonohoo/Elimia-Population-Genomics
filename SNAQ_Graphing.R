setwd("C:/Users/pred9/Desktop/AU_PhD/Auburn Stuff/2DRad-Ebell-Ecoc/Nov_Redos/SNAQ_Redo_Nov23/Check/")

library(ggplot2)
library(cowplot)

log <- c(2.93301449048633, 0.9480285425489448, 0.9387601564333179, 
         0.938760019222864, 0.9387599833337426, 0.9387599445276199)

hmax <- c(0:5)

plot(hmax, log, type="b", ylab="Network Score", xlab="hmax", col="blue", pch = 16)

# Extract Expected CFs - Net 0

data <- read.csv("fittedCF_net0.csv")

plot0 <- ggplot(data, aes(x=obsCF,y=expCF)) + theme_classic() +
  geom_segment(x=0,y=0,xend=1,yend=1, color="black", linewidth=0.5) + # diagonal line
  geom_point(alpha=0.5, color="maroon", size=4, position=position_jitter(width=0.005, height=0.005)) +
  ylab("quartet CF expected from network") + xlab("quartet CF observed in gene trees") + coord_equal(ratio=1) +
  labs(title="Net 0")

show(plot0)

results=lm(expCF~obsCF, data=data)
summary(results)

# Extract Expected CFs - Net 1

data1 <- read.csv("fittedCF_net1.csv")

plot1 <- ggplot(data1, aes(x=obsCF,y=expCF)) + theme_classic() +
  geom_segment(x=0,y=0,xend=1,yend=1, color="black", linewidth=0.5) + # diagonal line
  geom_point(alpha=0.5, size=4, color="maroon", position=position_jitter(width=0.005, height=0.005)) +
  ylab("quartet CF expected from network") + xlab("quartet CF observed in gene trees") + coord_equal(ratio=1) +
  labs(title="Net 1")

results1=lm(expCF~obsCF, data=data1)
summary(results1)

# Extract Expected CFs - Net 2

data2 <- read.csv("fittedCF_net2.csv")

plot2 <- ggplot(data2, aes(x=obsCF,y=expCF)) + theme_classic() +
  geom_segment(x=0,y=0,xend=1,yend=1, color="black", linewidth=0.5) + # diagonal line
  geom_point(alpha=0.5, size=4, color="maroon", position=position_jitter(width=0.005, height=0.005)) +
  ylab("quartet CF expected from network") + xlab("quartet CF observed in gene trees") + coord_equal(ratio=1) +
  labs(title="Net 2")

results2=lm(expCF~obsCF, data=data2)
summary(results2)

# Extract Expected CFs - Net 3

data3 <- read.csv("fittedCF_net3.csv")

plot3 <- ggplot(data3, aes(x=obsCF,y=expCF)) + theme_classic() +
  geom_segment(x=0,y=0,xend=1,yend=1, color="black", linewidth=0.5) + # diagonal line
  geom_point(alpha=0.5, size=4, color="maroon", position=position_jitter(width=0.005, height=0.005)) +
  ylab("quartet CF expected from network") + xlab("quartet CF observed in gene trees") + coord_equal(ratio=1) +
  labs(title="Net 3")

results3=lm(expCF~obsCF, data=data3)
summary(results3)

# Extract Expected CFs - Net 4

data4 <- read.csv("fittedCF_net4.csv")

plot4 <- ggplot(data4, aes(x=obsCF,y=expCF)) + theme_classic() +
  geom_segment(x=0,y=0,xend=1,yend=1, color="black", linewidth=0.5) + # diagonal line
  geom_point(alpha=0.5, size=4, color="maroon", position=position_jitter(width=0.005, height=0.005)) +
  ylab("quartet CF expected from network") + xlab("quartet CF observed in gene trees") + coord_equal(ratio=1) +
  labs(title="Net 4")

results4=lm(expCF~obsCF, data=data4)
summary(results4)

# Extract Expected CFs - Net 5

data5 <- read.csv("fittedCF_net5.csv")

plot5 <- ggplot(data5, aes(x=obsCF,y=expCF)) + theme_classic() +
  geom_segment(x=0,y=0,xend=1,yend=1, color="black", linewidth=0.5) + # diagonal line
  geom_point(alpha=0.5, size=4, color="maroon", position=position_jitter(width=0.005, height=0.005)) +
  ylab("quartet CF expected from network") + xlab("quartet CF observed in gene trees") + coord_equal(ratio=1) +
  labs(title="Net 5")

results5=lm(expCF~obsCF, data=data5)
summary(results5)

# Graph Plots side by side into a single PDF.

plot_grid(plot0, plot1, plot2, plot3, plot4, plot5, labels = c('A', 'B', 'C', 'D', 'E', 'F'), label_size = 12)

pdf(file= "SNAQ_Net0to5.pdf" )

par(mfrow=c(2,3))

plot0
plot1
plot2
plot3
plot4
plot5

dev.off()
