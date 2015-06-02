##5
r1<-readRDS("Source_Classification_Code.rds")
r2<-readRDS("summarySCC_PM25.rds")
m<- merge(r1,r2, by="SCC")
veh<- m[(m$type=="ON-ROAD" & m$fips=="24510"),]
data<-aggregate(Emissions ~ year, veh, sum)
png("plot5.png")
g <- ggplot(data, aes(year, Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()



