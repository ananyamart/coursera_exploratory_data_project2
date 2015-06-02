
r1<-readRDS("Source_Classification_Code.rds")
r2<-readRDS("summarySCC_PM25.rds")
m<- merge(r1,r2, by="SCC")
LA<- m[(m$type=="ON-ROAD" & m$fips=="06037"),]
LA_data<-aggregate(Emissions ~ year, LA, sum)
veh<- m[(m$type=="ON-ROAD" & m$fips=="24510"),]
baltimore_data <- aggregate(Emissions ~ year, veh, sum)
data <- merge(baltimore_data, LA_data, by = c("year") )
names(data) <- c("year", "baltimore","LA")
png("plot6.png")
library(tidyr)
q<- gather(data, Emissions,count,-year)
library(lattice)
xyplot(count~year|Emissions, q, type="l", lwd=2, xlab="year", ylab=expression("Total PM"[2.5]*"Emssions ON-ROAD"))
dev.off()