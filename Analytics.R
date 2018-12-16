
setwd("/Users/ryanlattanzi/Desktop/Fall 2018/CPT_S 570/Project")
traindat = read.csv("Training.csv")

######### Basics ########

avgtip = mean(traindat$tip_amount)
maxtip = max(traindat$tip_amount)

avgdis = mean(traindat$trip_distance)
maxdis = max(traindat$trip_distance)
tipmaxdis = traindat[which(traindat$trip_distance == max(traindat$trip_distance)),"tip_amount"]

maxfare = max(traindat$fare_amount)
tipmaxfare = traindat[which(traindat$fare_amount == maxfare),"tip_amount"]

######### Analyzing the number of tip classes that we get ########

hist(traindat$tip_class,
     main = "Histogram for Tip Class",
     xlab = "Tip Class",
     ylim = c(0,50000),
     col = "blue")

numcl1 = length(which(traindat$tip_class == 1))
numcl2 = length(which(traindat$tip_class == 2))
numcl3 = length(which(traindat$tip_class == 3))
numcl4 = length(which(traindat$tip_class == 4))

######### Relation between number of passengers and tip amount ########

hist(traindat$passenger_count,
     main = "Histogram for Passengers",
     xlab = "Passengers",
     ylim = c(0,60000),
     col = "blue")

pass = unique(traindat$passenger_count)
pass = sort(pass)
# Get rid of data with passenger count as 0
if (0 %in% pass){
  zero = which(pass == 0)
  pass = pass[-zero]
}

# This produces a list called p in which each element is a 4 dim vector:
# each vector corresponds to number of passengers:
# each element in the vector corresponds to the number of tips in class 1,2,3,4 resp
p = list()

i = 1
for (pa in pass){
  x = c(which(traindat$passenger_count == pa))
  k = traindat[x,ncol(traindat)]
  c1 = length(which(k == 1))
  c2 = length(which(k == 2))
  c3 = length(which(k == 3))
  c4 = length(which(k == 4))
  p[[i]] = c(c1,c2,c3,c4)
  i = i+1
}

# Produce a matrix that compares num of passengers and number of tips in each class
mat = matrix(0,length(pass),4)
for (j in 1:length(pass)){
  mat[j,] = p[[j]]
}

######### Plot the relation between length of trip and tip amount ########

plot(traindat$trip_distance, traindat$tip_amount, xlab = "Trip Distance", ylab = "Tip Amount",
     main = "Trip Distance vs. Tip Amount")
abline(lm(tip_amount ~ trip_distance, data = traindat), col="blue")

######### Plot the fair amount vs tip amount ########

plot(traindat$fare_amount, traindat$tip_amount, xlab = "Fare Amount", ylab = "Tip Amount",
     main = "Trip Fare vs. Tip Amount")
abline(lm(tip_amount ~ fare_amount, data = traindat), col="blue")

######### Percentages of tips $$$$$$$$

percent = as.data.frame(traindat$tip_amount/(traindat$fare_amount))
avgper = mean(percent$`traindat$tip_amount/(traindat$fare_amount)`)
length(which(percent>50)) # Number of people who tipped more than 50%

######## Dropoff Location and Tip classes ########

dropoffs = unique(traindat$DOLocationID)
dropoffs = sort(dropoffs)

l = list()

i = 1
for (dropoff in dropoffs){
  x = c(which(traindat$DOLocationID == dropoff))
  k = traindat[x,ncol(traindat)]
  c1 = length(which(k == 1))
  c2 = length(which(k == 2))
  c3 = length(which(k == 3))
  c4 = length(which(k == 4))
  l[[i]] = c(c1,c2,c3,c4)
  i = i+1
}

# Produce a matrix that show DO location and number of tips in each class
ma = matrix(0,length(dropoffs),4)
for (j in 1:length(dropoffs)){
  ma[j,] = l[[j]]
}

which(ma[,4] == max(ma[,4]))




