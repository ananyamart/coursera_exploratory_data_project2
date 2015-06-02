##3
r1<-readRDS("Source_Classification_Code.rds")
r2<-readRDS("summarySCC_PM25.rds")
w<-r2[(r2$fips=="24510"),]
x<- ddply(w, c("type","year"),summarize, sum(Emissions))
names(x)<- c("type","year","emissions")
library(ggplot2)
png("plot3.png")
ggplot(x,aes(x$year,x$emissions,col=type))+geom_point()+geom_line()+
  labs(x="year",y=expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
dev.off()


