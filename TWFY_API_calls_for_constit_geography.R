#Retrieves getGeometry from TheyWorkForYou, and dumps result as a stringIsle of Anglesey

#API key for TheyWorkForYou: FpJ8HCAbeFQLGb4bgZEFayD8

#change " " to "+"
#change "," to "%2C"


library(XML)
library(RCurl)

MP_data_extended$Constituency_for_API <- MP_data_extended$Constituency

MP_data_extended$Constituency_for_API <- gsub(" ", "+", MP_data_extended$Constituency_for_API)
MP_data_extended$Constituency_for_API <- gsub(",", "%2C", MP_data_extended$Constituency_for_API)

#https://www.theyworkforyou.com/api/function?key=key&output=output&other_variables

for (i in 1:nrow(MP_data_extended)){
  print(i)
  url <- paste0("https://www.theyworkforyou.com/api/getGeometry?key=FpJ8HCAbeFQLGb4bgZEFayD8&name=", MP_data_extended$Constituency_for_API[i], "&output=js")
  MP_data_extended$getGeometry[i] <- getURL(url, followlocation = TRUE)
}