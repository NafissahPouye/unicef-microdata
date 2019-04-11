library(readxl)      #for excel, csv sheets manipulation
library(sdcMicro)    #sdcMicro package with functions for the SDC process 
library(tidyverse)   #for data cleaning

#Import data
setwd("C:/Users/LENOVO T46OS/Desktop/unicef-microdata")
data <- read_excel("C:/Users/LENOVO T46OS/Desktop/unicef-microdata/data.xlsx", 
                   col_types = c("text", "numeric", "numeric", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "numeric", "numeric", "text", 
                                 "text", "text", "text", "numeric", 
                                 "text", "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "text", "text", 
                                 "text", "text", "text", "text", "text", 
                                 "text", "numeric", "numeric", "numeric", 
                                 "numeric", "text", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", 
                                 "numeric"))
#unicef dataset
selectedKeyVars <- c('Q11', 'Q13',	'Q14', 'Q17', 'Q18', 'Q21',
                     'Q22', 'Q24', 'Q38', 'Q39', 'Q40', 'Q42',
                     'Q43',	'Q44',	'Q45', 'Q51')

#Convert variables into factors
cols =  c('Q11', 'Q13', 'Q17', 'Q18', 'Q21',
          'Q22', 'Q24', 'Q38', 'Q39', 'Q40', 'Q42',
          'Q43',	'Q44',	'Q45', 'Q51')
data[,cols] <- lapply(data[,cols], factor)

# Convert the sub file into dataframe
fileRes<-data[,selectedKeyVars]
fileRes <- as.data.frame(fileRes)

#Assess the disclosure risk
objSDC <- createSdcObj(dat = fileRes, keyVars = selectedKeyVars)
print(objSDC, 'risk')
report(objSDC, filename = "index", internal = TRUE) 


