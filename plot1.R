
r1<-readRDS("Source_Classification_Code.rds")
r2<-readRDS("summarySCC_PM25.rds")
library(plyr)
pm<- data.frame(r2$Emissions, r2$year)
names(pm)<- c("Emissions","year")
t<-ddply(pm,"year", sum)
png('plot1.png')
barplot(height=as.vector(t$V1), names.arg=t$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()




