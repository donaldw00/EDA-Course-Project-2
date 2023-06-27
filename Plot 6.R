library(dplyr)
library(ggplot2)

SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
VehicleData <- SCC[grep("Vehicle",SCC$SCC.Level.Two), ]
VehicleList <- unique(VehicleData$SCC)
VehicleSubset <- subset(NEI,SCC %in% VehicleList)

BaltimoreEmissions <- VehicleSubset %>% filter(fips == "24510") %>% group_by(year)  %>% summarize(totalEmissions = sum(Emissions))
LAEmissions <- VehicleSubset %>% filter(fips == "06037") %>% group_by(year)  %>% summarize(totalEmissions = sum(Emissions))

ggplot()+
  geom_line(data = BaltimoreEmissions, mapping = aes(x = year, y = totalEmissions), color = "blue") +
  geom_line(data = LAEmissions, mapping = aes(x = year, y = totalEmissions), color = "red") +
  ggtitle("Vehicle Emissions (Baltimore - Blue) v (Los Angeles - Red)") + xlab("Year") + ylab ("PM2.5 Emissions (Tonnes)")