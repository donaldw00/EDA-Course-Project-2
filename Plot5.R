library(dplyr)
library(ggplot2)

SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
years = c(1999,2002,2005,2008)
VehicleData <- SCC[grep("Vehicle",SCC$SCC.Level.Two), ]
VehicleList <- unique(VehicleData$SCC)
VehicleSubset <- subset(NEI,SCC %in% VehicleList)

VehicleEmissions <- VehicleSubset %>% filter(fips == "24510") %>% group_by(year)  %>% summarize(totalEmissions = sum(Emissions))

plot5 <- plot(VehicleEmissions$year, VehicleEmissions$totalEmissions, type = "l", lwd = "2", main = "Vehicle PM25 Emissions in Baltimore", xlab = "Year", ylab = "Total PM2.5 Emissions (Tonnes)", ylim = c(0,500), xaxt = "n")
axis(1, at = years,labels = paste(years))
