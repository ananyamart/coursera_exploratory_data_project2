##4
library(ggplot2)
r1<-readRDS("Source_Classification_Code.rds")
r2<-readRDS("summarySCC_PM25.rds")
m<- merge(r1,r2, by="SCC")
coal<- grepl("Coal",m$Short.Name, ignore.case= TRUE)
subsetm<-m[coal,]
yearly<- aggregate(Emissions ~ year, subsetm, sum)
png("plot4.png")
g <- ggplot(yearly, aes(year, Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()


