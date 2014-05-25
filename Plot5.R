# read RDS files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Total emissions in Baltimore City (fips: 24510) 
a = subset(NEI, fips==24510 & type =="ON-ROAD")
            
#total emissions in Baltimore City in 1999, 2002, 2005, 2008
tot = aggregate(Emissions ~ year, data=a, sum)

#graph
png(filename="plot5.png", width=480, height=480, units="px")
barplot(tot$Emissions, 
        main=expression(Total~PM[2.5]~Emissions~from~Motor~Vehicle~Sources~In~Baltimore~City),
        xlab="Year", 
        ylab=expression(PM[2.5]~Emissions~(`in`~tons))
        )
axis(1, at=c(1:4), labels=c("1999", "2002", "2005", "2008"))
dev.off()