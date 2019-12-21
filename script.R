# Load packages
library(ggplot2)

# Read data
temp <- read.csv("18CPO060.out")
data <- temp[,2:3]
data$M <- data$M / 1000

temp <- read.csv("18CPO060_filtered.out")
fdata <- temp[,2:3]
fdata$M <- fdata$M / 1000

# Plot
pdf("1.pdf")
ggplot(data, aes(pI, M)) +
  geom_point(size=2, color="black")+
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x=element_text(colour="black",size=14), 
        axis.text.y=element_text(size=14,face="plain"), 
        axis.title.y=element_text(size = 14,face="plain"),
        axis.title.x=element_text(size = 14,face="plain"), 
        plot.title = element_text(size=15,face="bold",hjust = 0.5)) +
  xlim(12.9809,2.8357) +
  geom_vline(xintercept = mean(c(2.8357,12.9809))) +
  geom_hline(yintercept = mean(c(max(data$M), min(data$M)))) +
  ylab("Mr(kDa)") +
  xlab("pI") +
  ggtitle("Two-dimensional Electrophoresis\n(All ORFs)")
dev.off()

pdf("2.pdf")
ggplot(fdata, aes(pI, M)) +
  geom_point(size=2, color="black")+
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x=element_text(colour="black",size=14), 
        axis.text.y=element_text(size=14,face="plain"), 
        axis.title.y=element_text(size = 14,face="plain"),
        axis.title.x=element_text(size = 14,face="plain"), 
        plot.title = element_text(size=15,face="bold",hjust = 0.5)) +
  xlim(12.9809,2.8357) +
  #ylim(0,170)+
  geom_vline(xintercept = mean(c(2.8357,12.9809))) +
  geom_hline(yintercept = mean(c(max(data$M), min(data$M)))) +
  ylab("Mr(kDa)") +
  xlab("pI") +
  ggtitle("Two-dimensional Electrophoresis\n(Annotated ORFs)")
dev.off()

# Plot with limits
pdf("1_limit.pdf")
ggplot(data, aes(pI, M)) +
  geom_point(size=2, color="black")+
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x=element_text(colour="black",size=14), 
        axis.text.y=element_text(size=14,face="plain"), 
        axis.title.y=element_text(size = 14,face="plain"),
        axis.title.x=element_text(size = 14,face="plain"), 
        plot.title = element_text(size=15,face="bold",hjust = 0.5)) +
  xlim(12.9809,2.8357) +
  geom_vline(xintercept = mean(c(2.8357,12.9809))) +
  geom_hline(yintercept = mean(c(max(data$M), min(data$M)))) +
  ylab("Mr(kDa)") +
  xlab("pI") +
  ggtitle("Two-dimensional Electrophoresis\n(All ORFs)")
dev.off()

pdf("2_limit.pdf")
ggplot(fdata, aes(pI, M)) +
  geom_point(size=2, color="black")+
  theme_bw() +
  theme(legend.position="none", 
        axis.text.x=element_text(colour="black",size=14), 
        axis.text.y=element_text(size=14,face="plain"), 
        axis.title.y=element_text(size = 14,face="plain"),
        axis.title.x=element_text(size = 14,face="plain"), 
        plot.title = element_text(size=15,face="bold",hjust = 0.5)) +
  xlim(12.9809,2.8357) +
  #ylim(0,170)+
  geom_vline(xintercept = mean(c(2.8357,12.9809))) +
  geom_hline(yintercept = mean(c(max(data$M), min(data$M)))) +
  ylab("Mr(kDa)") +
  xlab("pI") +
  ggtitle("Two-dimensional Electrophoresis\n(Annotated ORFs)")
dev.off()