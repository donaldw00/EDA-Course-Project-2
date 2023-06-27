library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
years = c(1999,2002,2005,2008)
annual_emissions <- NEI %>% group_by(year) %>% 
summarize(totalEmissions = sum(Emissions))

plot1 <- plot(annual_emissions$year, annual_emissions$totalEmissions/1000, type = "l", lwd = "2", main = "Annual Total PM2.5 Emissions", xlab = "Year", ylab = "Total PM2.5 Emissions (KiloTonnes)", xaxt = "n")
axis(1, at = years,labels = paste(years))