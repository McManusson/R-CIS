# World population and plotting projections

# In first place, we bring the data:
pop <- read.csv("https://ourworldindata.org/wp-content/uploads/2013/05/WorldPopulationAnnual12000years_interpolated_HYDEandUNto2015.csv")

# For that case, we plot:
plot(pop, type="l", ylab="World Population")

# A bit large, huh? We select years
which(pop$year == 1600)
popR <- pop[which(pop$year == 1600):dim(pop)[1],]
plot(popR, type="l", las=1, ylab="Population", xlab="Year", cex.axis=.75, main="World population 1600-2100", xlim=c(1600,2100), ylim=c(0, 11000000000))

# Now, we incorporate the projections, in red
popp <- read.csv("http://ourworldindata.org/wp-content/uploads/nvd3/nvd3_lineChart_Kremer_CSV_WorldPop_MillionYears/Kremer_CSV_WorldPop_MillionYears.csv")
projections <- cbind(popp$year[98:106], popp$UN.Projection..Medium....2012.Revision[98:106] * 1000000)
lines(x=projections[,1], y=projections[,2], col="red")

# But we have a little hole. We can use Worldbank data [http://databank.worldbank.org/data/reports.aspx?source=Health%20Nutrition%20and%20Population%20Statistics:%20Population%20estimates%20and%20projections#] from 2016 to 2019
hole <- cbind(c(2015:2019), c(pop$World.Population..Spline.Interpolation.until.1950.[nrow(pop)],7429693000,7512207000,7593902000,7674730000))

# We update
projections <- rbind(hole, projections)

# Cheers!
