country <- read.csv('getdata-data-EDSTATS_Country.csv')

gdp <- read.csv('getdata-data-GDP.csv', skip=4)
gdp <- gdp[,c(1, 4, 5)]

gdpf <- merge(gdp, country, by.x = "X", by.y = "CountryCode")

gdpf <- arrange(gdpf, desc(X.4))