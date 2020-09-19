library(XML)
library(RCurl)

####Functions to get list of links from google search####---- 
getGoogleURL <- function(search.term, domain = '.co.uk', quotes=TRUE) 
{
  search.term <- gsub(' ', '%20', search.term)
  if(quotes) search.term <- paste('%22', search.term, '%22', sep='') 
  getGoogleURL <- paste('http://www.google', domain, '/search?q=',
                        search.term, sep='')
}

getGoogleLinks <- function(google.url) {
  doc <- getURL(google.url, httpheader = c("User-Agent" = "R
                                           (2.10.0)"))
  html <- htmlTreeParse(doc, useInternalNodes = TRUE, error=function
                        (...){})
  nodes <- getNodeSet(html, "//h3[@class='r']//a")
  return(sapply(nodes, function(x) x <- xmlAttrs(x)[["href"]]))
}

#----

for (i in 1:nrow(MP_data_extended)){
  print("")
  print(i)
  search.term <- paste0(MP_data_extended$First_name[i], " ", MP_data_extended$Second_name[i], " UK MP")
  print(search.term)
  
  quotes <- "FALSE"
  search.url <- getGoogleURL(search.term=search.term, quotes=quotes)

  links <- getGoogleLinks(search.url)
  
  if (any(grepl("wikipedia", links)) == TRUE){
  
  print("wiki link found")  
  wiki_link <- grep('wikipedia', links, value=TRUE) #find wikipedia link
  wiki_link <- sapply(strsplit(wiki_link, "&"), "[",1)
  wiki_link <- gsub("\\/url\\?q=", "", wiki_link) #final wikipedia link to be used to get text from wikipedia
  
  MP_data_extended$wiki_link[i] <- wiki_link
  }
}
