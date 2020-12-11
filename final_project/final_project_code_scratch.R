"""
DAT-204 FA20
R Final Project Code
Z. Trozenski
"""
tinytex::install_tinytex()
library(ggplot2)

# setting the proper directory to read in and write out to the location i want
print(getwd())
setwd("/Users/zack/dat204_ccac/final_project/")

# read in the csv file containing my data
storm_data <- read.csv('storm_data_PA_AGC_15-20.csv')


### COUNT OF STORMS
# what type of weather events were there?
events <- unique(storm_data$EVENT_TYPE)

## let's make a small dataframe to count the occurrences of each event to understand what
## happens most frequently here

# create empty vector
event_count <- vector()
# loop through the list of unique events, creating a vector of the sum of each matching instance
# of the unique events and their listing in the dataframe, return a vector of counts

for (s in events){
  local <- sum(storm_data$EVENT_TYPE == s)
  event_count <- c(event_count, local)
}

# create a dataframe from unique events and their counts with new headers and print 
event_totals <- data.frame("Weather.Event" = events, "Total.Count" = event_count)
print(event_totals)

### overall damage
# 
dam <- unique(storm_data$TOTAL_DAMAGE)

# create empty vector
count <- vector()

# loop through the list of unique events, creating a vector of the sum of each matching instance
# of the unique events and their listing in the data frame, return a vector of counts
for (s in dam){
  local <- sum(storm_data$TOTAL_DAMAGE == s)
  count <- c(count, local)
}

# create a data frame from unique events and their counts with new headers
count_totals <- data.frame("Damage.Value" = dam, "Count" = count)

print(count_totals)
ggplot(count_totals) + geom_point(aes(x = Damage.Value, y = Count), stat="identity", color = "#FF3300") + 
  scale_x_continuous(limit = c(0,100000)) + 
  scale_y_continuous(limit = c(0, 75)) + 
  theme(panel.background = element_rect(fill = "white")) + 
  theme(panel.grid.major.y = element_line(color="#CCCCCC")) #+
#theme(panel.grid.major.x = element_line(color="#CCCCCC"))


### DAMAGE
# Let's add a column to the data frame that sums all the damage estimates
total_damage <- storm_data$DAMAGE_PROPERTY_NUM + storm_data$DAMAGE_CROPS_NUM
storm_data$TOTAL_DAMAGE=total_damage

# Getting descriptive statistics on total damage
print(summary(storm_data$TOTAL_DAMAGE))

# Using the mean from the descriptive statistics, let's see what the most destructive
# storms over the past 5 years have been
destruction <- storm_data[storm_data$TOTAL_DAMAGE > 33262, ]

# to better plot the data let's scale down the damage
scaled_damage <- destruction$TOTAL_DAMAGE / 1000000
#print(scaled_damage)
destruction$SCALED_DAMAGE=scaled_damage

ggplot(destruction, aes(y=BEGIN_DATE, x=SCALED_DAMAGE)) +
  geom_histogram(stat="identity", fill="#006699") +
  theme(axis.text.y = element_text(size=5, angle=15)) +
  labs(y = "Storm Date", title = "Above Avgerage Storm Damage 2015 - 2020 in Allegheny County",
       x = "Damage (Million USD)") +
  theme(panel.background = element_rect(fill = "white"))


### MOST DESTRUCTIVE
# let's dig into these destructive storms some more and pare down the original dataset
dest_small <- destruction[ , c("BEGIN_LOCATION", "BEGIN_DATE", "EVENT_TYPE", "MAGNITUDE",
                               "FLOOD_CAUSE", "END_LOCATION", "BEGIN_LAT",
                               "BEGIN_LON", "END_LAT","END_LON")]
print(dest_small)

# is there a trend in severe weather events increasing over time?
# need to extract the year values from the BEGIN_DATE column, so we'll read the row values as date
# objects, then only pull the year
storm_years <- format(as.Date(dest_small$BEGIN_DATE, format="%m/%d/%Y"),"%Y")
# now that we have a vector of years, let's add it as a new column to our dataframe
dest_small$YEAR=storm_years

# Now let's plot the severe weather by year to see if there's a trend
ggplot(dest_small, aes(x=YEAR)) + geom_bar(stat="count", fill="#CC99FF") +
  labs(x = "Severe Weather Events Per Year", y = "Count") +
  labs(title = "Distribution of Above Average Destructive Storms in Allegheny County by Year ") +
  theme(panel.background = element_rect(fill = "white"))

### TSTORM WIND
# The most common event are thunderstorm winds, let's slice the dataset to only show thunderstorm
# wind records so we can analyze it

t_storms <- storm_data[storm_data$EVENT_TYPE == "Thunderstorm Wind", ]

# There are two methods of capturing windspeed, let's plot them to better understand the data
ggplot(data = t_storms, mapping = aes(y = MAGNITUDE, x = MAGNITUDE_TYPE)) + 
  geom_boxplot(fill="#FF6666") + theme(panel.background = element_rect(fill = "white")) +
  theme(panel.grid.major.y = element_line(color="#CCCCCC")) + 
  labs(y = "Wind Speed in Knots", x = "Estimated vs. Measured") +
  labs(title = "Estimated vs. Meaured Thunderstrom Wind Speed")

# Now let's plot the windspeed in knots by damage
ggplot(data = t_storms, mapping = aes(y = MAGNITUDE, x = TOTAL_DAMAGE, color = MAGNITUDE_TYPE)) +
  geom_point() +
  scale_y_continuous(limits = c(40,76)) +
  labs(x = "Total Damage (USD)", y = "Wind Speed in Knots", color = "Measured vs. Estimated") +
  labs(title = "Damage By Thunderstorm Wind Speed")

# There looks like there's a *little* bit of correlation there but let's calculate the coefficient
cor(t_storms$MAGNITUDE, t_storms$TOTAL_DAMAGE)
# The correlation coefficient is very low and close to zero indicating no correlation between
# wind speed and total damage. This comes to me as a surprise since it stands to reason that
# higher winds would contribute to more damage. However it seems within this data set that is
# not the case


## Plot coordinates!
library(tidyverse)
library(sf)
library(leaflet)
library(mapview)

mapview(t_storms, xcol = "BEGIN_LON", ycol = "BEGIN_LAT", crs = 4269, grid = FALSE)
