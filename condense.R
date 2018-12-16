
# Jan 2017
jan2017 = read.csv("1_2017.csv")
jan_2017 = subset(jan2017, PULocationID == 230 & payment_type == 1)
write.csv(jan_2017, file = "jan_2017.csv")

# Feb 2017

feb_2017 = subset(yellow_tripdata_2017.02, PULocationID == 230 & payment_type == 1)
write.csv(feb_2017, file = "feb_2017.csv")

# March 2017

march_2017 = subset(yellow_tripdata_2017.03, PULocationID == 230 & payment_type == 1)
write.csv(march_2017, file = "march_2017.csv")

# April 2017

april_2017 = subset(yellow_tripdata_2017.04, PULocationID == 230 & payment_type == 1)
write.csv(april_2017, file = "april_2017.csv")

# May 2017

may_2017 = subset(yellow_tripdata_2017.05, PULocationID == 230 & payment_type == 1)
write.csv(may_2017, file = "may_2017.csv")

# June 2017

june_2017 = subset(yellow_tripdata_2017.06, PULocationID == 230 & payment_type == 1)
write.csv(june_2017, file = "june_2017.csv")

# July 2017

july_2017 = subset(yellow_tripdata_2017.07, PULocationID == 230 & payment_type == 1)
write.csv(july_2017, file = "july_2017.csv")

# Aug 2017

aug_2017 = subset(yellow_tripdata_2017.08, PULocationID == 230 & payment_type == 1)
write.csv(aug_2017, file = "aug_2017.csv")

# Sep 2017

sep_2017 = subset(yellow_tripdata_2017.09, PULocationID == 230 & payment_type == 1)
write.csv(sep_2017, file = "sep_2017.csv")

# Oct 2017

oct_2017 = subset(yellow_tripdata_2017.10, PULocationID == 230 & payment_type == 1)
write.csv(oct_2017, file = "oct_2017.csv")

# Nov 2017

nov_2017 = subset(yellow_tripdata_2017.11, PULocationID == 230 & payment_type == 1)
write.csv(nov_2017, file = "nov_2017.csv")

# Dec 2017

dec_2017 = subset(yellow_tripdata_2017.12, PULocationID == 230 & payment_type == 1)
write.csv(dec_2017, file = "dec_2017.csv")


# Mar 2018

mar_2018 = subset(yellow_tripdata_2018.03, PULocationID == 230 & payment_type == 1)
write.csv(mar_2018, file = "mar_2018.csv")


# May 2018

may_2018 = subset(yellow_tripdata_2018.05, PULocationID == 230 & payment_type == 1)
write.csv(may_2018, file = "may_2018.csv")


# Testing
# Feb 2018

feb_2018 = subset(yellow_tripdata_2018.02, PULocationID == 230 & payment_type == 1)
write.csv(feb_2018, file = "feb_2018.csv")


# Apr 2018

apr_2018 = subset(yellow_tripdata_2018.04, PULocationID == 230 & payment_type == 1)
write.csv(apr_2018, file = "apr_2018.csv")

# June 2018

june_2018 = subset(yellow_tripdata_2018.06, PULocationID == 230 & payment_type == 1)
write.csv(june_2018, file = "june_2018.csv")










