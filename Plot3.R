library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

baltimore2 <- NEI %>% group_by(type, year) %>% filter(fips == "24510") %>% summarize(totalEmissions = sum(Emissions))

ggplot(baltimore2, aes(x = factor(year), y = baltimore2$totalEmissions, fill = type, label = round(totalEmissions))) + ggtitle("Annual PM2.5 Emissions by Type in Baltimore ") + xlab("Year") + ylab ("PM2.5 Emissions (Tonnes)") + geom_bar(stat = "identity") + facet_grid(.~ type) + theme_classic() + theme(plot.title = element_text(hjust = 0.5))
