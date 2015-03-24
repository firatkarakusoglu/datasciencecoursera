country <- read.csv('getdata-data-EDSTATS_Country.csv')
countryName <- country[,c('CountryCode', 'Short.Name', 'Income.Group')]

gdp <- read.csv('getdata-data-GDP.csv', skip=4)
gdp <- gdp[, c(1, 2, 4, 5)]
names(gdp) <- c('Code', 'Rank', 'Name', 'GDP')

gdpRanked <- gdp[!is.na(gdp$Rank),]

gdpf <- merge(gdpRanked, countryName, by.x = "Code", by.y = "CountryCode")

gdpf <- arrange(gdpf, desc(Rank))

head(gdpf, 13)

hincome <- subset(gdpf, Income.Group == 'High income: OECD')
hincomeN <- subset(gdpf, Income.Group == 'High income: nonOECD')

mean(as.numeric(hincome$Rank))
mean(as.numeric(hincomeN$Rank))

gdpf$Group <- cut2(gdpf$Rank, g = 5)
gdpf$GroupNum <- as.numeric(gdpf$Group)

g5 <- subset(gdpf, GroupNum == 1 & Income.Group == 'Lower middle income')

