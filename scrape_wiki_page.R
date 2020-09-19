library(XML)
library(RCurl)

for (i in 1:nrow(MP_data_extended)){
  print(i)
  url <- MP_data_extended$wiki_link[i]
  
  # download html
  html <- getURL(url, followlocation = TRUE)

  # parse html to text
  doc = htmlParse(html, asText=TRUE)
  plain.text <- xpathSApply(doc, "//p", xmlValue)
  cat(paste(plain.text, collapse = "\n"))
  plain.text <- paste(plain.text, collapse = '') #collapse to one string

  sentences <- unlist(strsplit(plain.text, "\\.")) #create vector of sentences

  if (grepl("\\s[Bb]orn\\s", plain.text) == TRUE){ #check if word 'born' is in text
    print('Reference to Born found\n')
    born_sentences <- grep("\\s[Bb]orn\\s", sentences, value = TRUE) #retrieve sentences with word 'born'
    born_references <- paste(born_sentences, collapse = ' ') #collapse to one string
    MP_data_extended$born_references[i] <- born_references
  }else{
    print("no reference to Born\n")
  }
}
