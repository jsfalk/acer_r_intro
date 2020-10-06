################
## Arithmetic ##
################

# addition
4 + 5
# same code as above, without spaces
4+5

# subtraction
2 - 3
# multiplication
2 * 3
# division
2 / 3
# exponentiation
2 ^ 3

#####################
## Using functions ##
#####################

# using a function: rounding numbers
round(3.14)
# using a function with more arguments
round(3.14, digits = 1)
# can switch order of arguments
round(digits = 1, x = 3.14)

# getting help
?hist

# assigning value to an object
weight_kg <- 55
# recall object
weight_kg
# multiple an object (convert kg to lb)
2.2 * weight_kg
# assign weight conversion to object
weight_lb <- 2.2 * weight_kg
# reassign new value to an object
weight_kg <- 100
weight_kg

# multiple operations
mass <- 47.5            # mass?
width  <- 122             # width?
mass <- mass * 2.0      # mass?
width  <- width - 20        # width?
mass_index <- mass/width  # mass_index?

#############
## Vectors ##
#############

# assign vector
ages <- c(50, 55, 60, 65) 
# recall vector
ages

# how many things are in object?
length(ages)
# what type of object?
class(ages)
# get overview of object
str(ages)

# performing functions with vectors
mean(ages)
range(ages)

# vector of body parts
organs <- c("lung", "prostate", "breast")

length(organs)
class(organs)
str(organs)

# add a value to end of vector
ages <- c(ages, 90) 
# add value at the beginning
ages <- c(30, ages)

# extracting second value
organs[2] 
# excluding second value
organs[-2] 
# extracting first and third values
organs[c(1, 3)] 

# condition
ages > 60 
# extracts values which meet condition
ages[ages > 60] 
# extracts values numerically equivalent values
ages[ages == 60]
# ages less than 50 OR greater than 60
ages[ages < 50 | ages > 60]
# ages greater than 50 AND less than 60
ages[ages > 50 & ages < 60]

##################
## Missing data ##
##################

# create a vector with missing data
heights <- c(2, 4, 4, NA, 6)

# calculate mean and max on vector with missing data
mean(heights)
max(heights)

# add argument to remove NA
mean(heights, na.rm = TRUE)
max(heights, na.rm = TRUE)

# identify elements which are missing data
is.na(heights)
# reverse the TRUE/FALSE
!is.na(heights)
# extract elements which are not missing values
heights[!is.na(heights)]
# remove incomplete cases
na.omit(heights)

#################
## Data frames ##
#################

# make a directory
dir.create("data")
# download data from url
download.file("https://raw.githubusercontent.com/jsfalk/acer_tutorials/master/r_intro/data/animals.csv", "data/animals.csv")
# import data and assign to object
animals <- read.csv("data/animals.csv")

# assess size of data frame
dim(animals)
# preview first few rows
head(animals) 
# show last three rows
tail(animals, n = 3) 
# view column names
names(animals) 
# show overview of object
str(animals) 
# provide summary statistics for each column
summary(animals) 

# extract first column and assign to a variable
first_column <- animals[1]
# extract first row 
first_row <- animals[1, ]
# extract first column
first_column_again <- animals[ , 1]
# extract cell from first row of first column
single_cell <- animals[1,1]
# extract a range of cells, rows 1 to 3, second column
range_cells <- animals[1:3, 2]
# exclude first column
exclude_col <- animals[ , -1] 
# exclude first 100 rows
exclude_range <- animals[-c(1:100), ] 
# extract column by name
name_col1 <- animals["taxa"]
name_col2 <- animals[ , "taxa"]
# double square brackets syntax
name_col3 <- animals[["taxa"]]
# dollar sign syntax
name_col4 <- animals$taxa

# Export the data with the first hundred rows excluded
write.csv(exclude_range, "data/animals_subset.csv")

# functions on columns
range(animals$weight, na.rm = TRUE)
mean(animals$weight, na.rm = TRUE)

#######################
## Data manipulation ##
#######################

# install package
install.packages("dplyr")
# load library/package
library(dplyr)

# selecting columns with dplyr
sel_columns <- select(animals, sex, weight, taxa)
# select range of columns
sel_columns2 <- select(animals, sex:taxa)
# select columns to remove
sel_columns3 <- select(animals, -sex, -hindfoot_length)

# select rows conditionally: keep only rodents
filtered_rows <- filter(animals, taxa == "Rodent") 

sex_taxa <- select(animals, sex, taxa)
sex_rodent <- filter(sex_taxa, taxa=="Rodent")

# nested select and filter
sex_rodent <- select(filter(animals, taxa == "Rodent"), sex, taxa)

# same task as above, but with pipes
piped <- animals %>%
  select(sex, taxa) %>%
  filter(taxa == "Rodent")

# extract sex and weight from samples before 1995
piped2 <- animals %>%
  filter(year < 1995) %>%
  select(sex, weight)

# convert grams to kilograms
clinical_kg <- animals %>%
  mutate(weight_kg = weight / 1000)

# convert weight to kgs and lbs at same time, and we don't always need to assign to object
animals %>%
  mutate(weight_kg = weight / 1000,
         weight_lb = weight_kg * 2.2) %>%
  glimpse() # preview data output

# show categories in gender
unique(animals$sex)

# count number of individuals of each gender
animals %>%
  group_by(sex) %>%
  tally()

# summarize average days to death by gender
animals %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

# remove NA
animals %>%
  filter(!is.na(sex)) %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm=TRUE))

# counting number of records for each species
species_counts <- animals %>%
  count(species) %>%
  arrange(n)

# get names of frequently occurring species
frequent_species <- species_counts %>%
  filter(n >= 500)

# extract data from species to keep
animals_reduced <- animals %>%
  filter(species %in% frequent_species$species)

# save results to file in data/ named animals_reduced
write.csv(animals_reduced, "data/animals_reduced.csv")
