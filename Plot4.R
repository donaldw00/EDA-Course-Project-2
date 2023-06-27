library(dplyr)
library(ggplot2)

SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
years = c(1999,2002,2005,2008)
CoalData <- SCC[grep("Fuel Comb.*Coal",SCC$EI.Sector), ]
CoalList <- unique(CoalData$SCC)
CoalSubset <- subset(NEI,SCC %in% CoalList)

CoalEmissions <- CoalSubset %>% group_by(year) %>% summarize(totalEmissions = sum(Emissions))

plot4 <- plot(CoalEmissions$year, CoalEmissions$totalEmissions/1000, type = "l", lwd = "2", main = "Coal Combustion PM2.5 Pollution", xlab = "Year", ylab = "Total PM2.5 Emissions (KiloTonnes)", ylim = c(0,600), xaxt = "n")
axis(1, at = years,labels = paste(years))