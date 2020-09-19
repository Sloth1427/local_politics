#Get lon and lat from birth places
#Works!

# METHOD 2: CODE TO GET THE LATITUDE AND LONGITUDE OF A STREET ADDRESS WITH GOOGLE API
library(ggmap)
library(XML)
library(RCurl)


for (i in 1:nrow(MP_data_extended)){
  if (is.na(MP_data_extended$born_location[i]) == FALSE){
  print(i)

  addr <- MP_data_extended$born_location[i]  # set your address here
  url = paste('http://maps.google.com/maps/api/geocode/xml?address=', addr,'&sensor=false',sep='')  # construct the URL
  doc = xmlTreeParse(url) 
  root = xmlRoot(doc) 
  lat = xmlValue(root[['result']][['geometry']][['location']][['lat']]) 
  long = xmlValue(root[['result']][['geometry']][['location']][['lng']])
  
  MP_data_extended$born_location_lon[i] <- long
  MP_data_extended$born_location_lat[i] <- lat
  }
}
  
