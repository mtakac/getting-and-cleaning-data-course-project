# Code book

## Variables
"subject"
"activity"
"timebodyaccelerometermeanx"
"timebodyaccelerometermeany"
"timebodyaccelerometermeanz"
"timebodyaccelerometerstdx"
"timebodyaccelerometerstdy"
"timebodyaccelerometerstdz"
"timegravityaccelerometermeanx"
"timegravityaccelerometermeany"
"timegravityaccelerometermeanz"
"timegravityaccelerometerstdx"
"timegravityaccelerometerstdy"
"timegravityaccelerometerstdz"
"timebodyaccelerometerjerkmeanx"
"timebodyaccelerometerjerkmeany"
"timebodyaccelerometerjerkmeanz"
"timebodyaccelerometerjerkstdx"
"timebodyaccelerometerjerkstdy"
"timebodyaccelerometerjerkstdz"
"timebodygyroscopemeanx"
"timebodygyroscopemeany"
"timebodygyroscopemeanz"
"timebodygyroscopestdx"
"timebodygyroscopestdy"
"timebodygyroscopestdz"
"timebodygyroscopejerkmeanx"
"timebodygyroscopejerkmeany"
"timebodygyroscopejerkmeanz"
"timebodygyroscopejerkstdx"
"timebodygyroscopejerkstdy"
"timebodygyroscopejerkstdz"
"timebodyaccelerometermagnitudemean"
"timebodyaccelerometermagnitudestd"
"timegravityaccelerometermagnitudemean"
"timegravityaccelerometermagnitudestd"
"timebodyaccelerometerjerkmagnitudemean"
"timebodyaccelerometerjerkmagnitudestd"
"timebodygyroscopemagnitudemean"
"timebodygyroscopemagnitudestd"
"timebodygyroscopejerkmagnitudemean"
"timebodygyroscopejerkmagnitudestd"
"frequencybodyaccelerometermeanx"
"frequencybodyaccelerometermeany"
"frequencybodyaccelerometermeanz"
"frequencybodyaccelerometerstdx"
"frequencybodyaccelerometerstdy"
"frequencybodyaccelerometerstdz"
"frequencybodyaccelerometerjerkmeanx"
"frequencybodyaccelerometerjerkmeany"
"frequencybodyaccelerometerjerkmeanz"
"frequencybodyaccelerometerjerkstdx"
"frequencybodyaccelerometerjerkstdy"
"frequencybodyaccelerometerjerkstdz"
"frequencybodygyroscopemeanx"
"frequencybodygyroscopemeany"
"frequencybodygyroscopemeanz"
"frequencybodygyroscopestdx"
"frequencybodygyroscopestdy"
"frequencybodygyroscopestdz"
"frequencybodyaccelerometermagnitudemean"
"frequencybodyaccelerometermagnitudestd"
"frequencybodyaccelerometerjerkmagnitudemean"
"frequencybodyaccelerometerjerkmagnitudestd"
"frequencybodygyroscopemagnitudemean"
"frequencybodygyroscopemagnitudestd"
"frequencybodygyroscopejerkmagnitudemean"
"frequencybodygyroscopejerkmagnitudestd"

### subject
*Integer* in range 1:30 identifying subject of the experiment

### activity
*Character* identifying activity in the experiment. Can be one of `"laying", "sitting", 
"standing", "walking", "walking_downstairs", "walking_upstairs"`.

### Others
Rest of the variables are all *numeric*. They represent the means of the experiment's
measurments on the mean and standard deviation grouped by **subject** and **activity**.
They have been modified from the original following this key:
```
t -> time
f -> frequency
acc -> accelerometer
gyro -> gyroscope
mag -> magnitude
bodybody -> body

Read more in `./data/UCI HAR Dataset/features_info.txt

