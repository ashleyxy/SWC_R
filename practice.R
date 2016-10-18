again I am trying to do some mor chnages to ths document. I hope it will work for me

I just added a line or two i guess
########################

Where : Hatcher library
What : Software Carpentry
When: October 18th
Who: Shanna Ashley

Packages necessary for this analysis

library(RSQLite)

conn<-dbConnect(SQLite(), dbname='/Users/shannaashley/Desktop/survey.sqlite')

tables <- dbListTables(conn)                
tables

class(tables)

surveys<- dbGetQuery(conn, 'SELECT * FROM surveys')
head(surveys)
summary(surveys)

surveys <- dbGetQuery(conn, 
'SELECT *FROM surveys
JOIN species ON surveys.species_id = 
species.species_id 
  JOIN plots ON surveys.plot_id =plots.plot_id;')

surveys <- read.csv('/Users/shannaashley/Desktop/ecology.csv')

list(99, TRUE, 'balloons')
list(1:10, c(TRUE, FALSE))
str(surveys)
class(surveys$year)
class(surveys['year'])
head(surveys$year)
head(surveys['year'])
surveys$sex
levels(surveys$sex)
?factor
levels(spice)
tabulation <- table(surveys$taxa)
tabulation
barplot(tabulation)
max(surveys$taxa)
barplot(tabulation)
order(surveys$taxa)
surveys$taxa <-ordered(surveys$taxa, levels = c('Rodent', 'Bird', 'Rabbit', 'Reptile'))
barplot
surveys$taxa
barplot(table(surveys$taxa))
table(surveys$year, surveys$taxa)
with(surveys, table(year, taxa))
sort(surveys$weight)
rm(conn)
surveys$taxa =='Rodent'
length(surveys$taxa =='Rodent')
dim(surveys)
surveys[surveys$taxa == 'Rodent', 'taxa']
seq.int(1980, 1990)
surveys$taxa > 1980
surveys[surveys$taxa > 1980 & surveys$taxa == 'Rodents', 'taxa']
surveys[surveys$taxa =='Rodents',]
surveys$taxa
install.packages('dplyr')
library(dplyr)
output <- select(surveys, year, taxa, weight)
head(output)
filter(surveys, taxa == 'Rodent')
conn<-dbConnect(SQLite(), dbname='/Users/shannaashley/Desktop/survey.sqlite')

surveys[,1] = NULL
rodent_surveys <- surveys %>%
  filter(taxa =='Rodent') %>%
  select(year, taxa, weight)
head(rodent_surveys)

surveys %>%
  mutate(weight_kg = weight/1000)
surveys_complete <- surveys %>%
  filter(!is.na(weight), 
         species_id != '',
         !is.na (hindfoot_length),
         sex != '',
         taxa == 'Rodent') 
common_species <- surveys_complete %>%
  group_by(species_id) %>%
  tally() %>%
  filter(n >= 50) %>%
  select(species_id)

common_surveys <- surveys_complete %>%
  filter(species_id %in% common_species$species_id)


# ggplot2
library(ggplot2)
ggplot(data = common_surveys,
       aes(
         x=weight,
         y= hindfoot_length,
         color = species_id)) +
  geom_point()
       
