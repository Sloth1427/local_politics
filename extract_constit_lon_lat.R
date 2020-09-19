#script to extract centre longitude and latitude of constituency from getGeometry string

# for (i in 469:nrow(MP_data_extended)){
#   print(i)
#   geometryString <- MP_data_extended$getGeometry[i]
#   geometryList <- unlist(strsplit(geometryString, ","))
#   MP_data_extended$Constituency_lon[i] <- grep("centre_lon", geometryList, value = TRUE)
#   MP_data_extended$Constituency_lat[i] <- grep("centre_lat", geometryList, value = TRUE)
# }

# MP_data_extended$Constituency_lon2 <- MP_data_extended$Constituency_lon
# MP_data_extended$Constituency_lat2 <- MP_data_extended$Constituency_lat
# 
# MP_data_extended$Constituency_lon2 <- gsub('"centre_lon":', "", MP_data_extended$Constituency_lon2)
# MP_data_extended$Constituency_lat2 <- gsub('"centre_lat":', "", MP_data_extended$Constituency_lat2)

MP_data_extended$Constituency_lon2 <- gsub('\\{', "", MP_data_extended$Constituency_lon2)
MP_data_extended$Constituency_lat2 <- gsub('\\{', "", MP_data_extended$Constituency_lat2)

