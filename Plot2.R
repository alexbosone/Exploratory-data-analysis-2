
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Baltimore City (fips: 24510)
baltimore = subset(NEI, fips==24510)

#Emissions in Baltimore City 99-08
totalEmi = aggregate(Emissions ~ year, data=baltimore, sum)

# plot
png(filename="plot2.png", width=480, height=480, units="px")
plot(totalEmi$Emissions, type="b", 
     xaxt="n",  xlab="Year", 
     ylab=expression(PM[2.5]~Emissions~(`in`~tons)), 
     main=expression(Total~PM[2.5]~Emissions~`in`~Baltimore~City))
axis(1, at=c(1:4), labels=c("1999", "2002", "2005", "2008"))
dev.off()