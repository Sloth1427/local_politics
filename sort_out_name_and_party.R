
#extract party from name, and put in party column

#MP_data_as_of_270317$Party <- gsub("(?<=\\()[^()]*(?=\\))(*SKIP)(*F)|.", "", MP_data_as_of_270317$Name, perl = T)

#MP_data_as_of_270317$Party <- gsub("Co-op", "Labour (Co-op)", MP_data_as_of_270317$Party, perl = T)

#MP_data_as_of_270317$Name <- gsub("\\s*\\([^\\)]+\\)", "", MP_data_as_of_270317$Name)

#MP_data_as_of_270317$Name <- gsub("\\)", "", MP_data_as_of_270317$Name)

#MP_data_as_of_270317$First_name <- sapply(strsplit(MP_data_as_of_270317$Name, ","), "[",2)

#MP_data_as_of_270317$Second_name <- sapply(strsplit(MP_data_as_of_270317$Name, ","), "[",1)

write.csv(MP_data_as_of_270317, file = "MP_data_extended.csv")