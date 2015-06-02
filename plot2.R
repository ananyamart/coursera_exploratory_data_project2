##2
r1<-readRDS("Source_Classification_Code.rds")
r2<-readRDS("summarySCC_PM25.rds")
w<-r2[(r2$fips=="24510"),]
d<- data.frame(w$year, w$Emissions)
baltimore<-ddply(d,"w$year", sum)
png("plot2.png")
barplot(height= as.vector(baltimore$V1), names.arg=baltimore$w.year, xlab="year", ylab="Emissions", main=expression('Total PM'[2.5]*' emissions at various years')) 
dev.off()

