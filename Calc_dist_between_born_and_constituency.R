#Calc distance between born location and constituency
library(geosphere)

#distance in metres

for (i in 1:nrow(MP_data_extended)){
  if (is.na(MP_data_extended$born_location[i]) == FALSE){
    print(i)
    
    lon1 <- as.numeric(MP_data_extended$born_location_lon[i])
    lat1 <- as.numeric(MP_data_extended$born_location_lat[i])
    
    lon2 <- as.numeric(MP_data_extended$Constituency_lon2[i])
    lat2 <- as.numeric(MP_data_extended$Constituency_lat2[i])
    
    
    MP_data_extended$distance[i] <- distm(c(lon1, lat1), c(lon2, lat2), fun = distHaversine)
  }
}