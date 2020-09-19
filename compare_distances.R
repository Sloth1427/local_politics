#compare distance between birth and constituency across parties

data <- MP_data_extended
data <- data[!is.na(data$distance_km),]
Party_list <- levels(MP_data_extended$Party)

Summary <- data.frame(Party_list)
Summary$mean <- NA
Summary$median <- NA

for (i in 1:nrow(Summary)){
  party <- Summary$Party_list[i]
  temp <- subset(data, Party == party)
  Summary$mean[i] <- mean(temp$distance_km)
  Summary$median[i] <- median(temp$distance_km)
}