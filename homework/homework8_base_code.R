# change the directory so we can use the csv
setwd("/Users/zack/dat204_ccac/")

# load the CSV
dogs <- read.csv('allegheny_county_dog_licenses.csv')
# check CSV out
head(dogs)

# extract all rows matching my ZIP
dogs_in_my_zip <- dogs[dogs$OwnerZip == 15238, ]
# sanity check CSV
head(dogs_in_my_zip)

# Pull vector of unique dog breeds in my ZIP
breeds_in_my_zip <- unique(dogs_in_my_zip$Breed)

# Create a vetor of breed counts in my ZIP
breed_num <- vector()
for (breed in breeds_in_my_zip){
  temp <- sum(dogs_in_my_zip$Breed == breed)
  breed_num <- c(breed_num, temp)
}

# New dataframe of breed counts in my ZIP
breed_counts_in_my_zip <- data.frame("Breed" = breeds_in_my_zip, "Count" = breed_num)
head(breed_counts_in_my_zip)
# Reorder to sort by highest count
ordered_breeds <- breed_counts_in_my_zip[order(-breed_counts_in_my_zip$Count),]
top_breeds <- ordered_breeds[1:10, ]

library(ggplot2)
ggplot(top_breeds, aes(x = top_breeds$Breed, y = top_breeds$Count)) + 
  geom_bar(stat = "identity", fill = "blue") +
  labs(x = "Breed Name", y = "Count", title = "Most Popular Dog Breeds in 15238") +
  theme(axis.text.x = element_text(size=5, angle=15)) + 
  theme(panel.background = element_rect(fill = "white")) +
  theme(panel.grid.major.y = element_line(color="black"))






