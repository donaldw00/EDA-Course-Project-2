library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
years = c(1999,2002,2005,2008)
baltimore <- NEI %>% group_by(year) %>% filter(fips == "24510") %>% summarize(totalEmissions = sum(Emissions))

plot2 <- plot(baltimore$year,baltimore$totalEmissions,type = "l", lwd = "2", main = "Annual Total PM2.5 Emissions in Baltimore", xlab = "Year", ylab = "Total PM2.5 Emissions (Tonnes)", xaxt = "n")
axis(1, at = years,labels = paste(years))