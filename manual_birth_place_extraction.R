
#go through all the ones where wiki 'born' references are given
# for (i in 1:nrow(MP_data_extended)){
#   if (is.na(MP_data_extended$born_references[i]) == FALSE){
#     print(i)
#     print(as.character(MP_data_extended$Name[i]))
#     print(as.character(MP_data_extended$born_references[i]))
#     MP_data_extended$born_location[i] <- readline(prompt="Enter birth place: ")
#     write.csv(MP_data_extended, file = "MP_data_extended.csv")
#   }
# }
  
# for (i in 1:nrow(MP_data_extended)){
#   if (is.na(MP_data_extended$born_location[i]) == TRUE){
#     print(i)
#     print(as.character(MP_data_extended$Name[i]))
#     MP_data_extended$born_location[i] <- readline(prompt="Enter birth place: ")
#     write.csv(MP_data_extended, file = "MP_data_extended.csv")
#   }
# }

for (i in 1:nrow(MP_data_extended)){
  if (grepl("\\?",MP_data_extended$born_location[i]) == TRUE){
    print(i)
    print(as.character(MP_data_extended$Name[i]))
    print(as.character(MP_data_extended$born_location[i]))
    MP_data_extended$born_location[i] <- readline(prompt="Enter birth place: ")
    write.csv(MP_data_extended, file = "MP_data_extended.csv")
  }
}