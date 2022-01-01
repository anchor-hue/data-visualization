message <- read.csv("D:/Rstudio/bigwork/cleaned2018famecon.csv",header = TRUE)
urban <- c(t(message[,"urban18"]))
income1 <- c(t(message[,"fincome1"]))
incomec2 <- c()
incomex2 <- c()
for(i in 1:length(income1))
{
  #urban
  if(urban[i]=='城镇')
  {
    tool1 <- as.numeric(income1[i])
    incomec2 <- c(incomec2,tool1)
  }
  
  #country
  if(urban[i]=='乡村')
  {
    tool2 <- as.numeric(income1[i])
    incomex2 <- c(incomex2,tool2)
  }
}
numc1 <- 0
numc2 <- 0
numc3 <- 0
for (j in 1:length(incomec2)) 
{
  if(incomec2[j]<30000)
  {
    numc1 <- numc1+1
  }
  if(incomec2[j]>=30000 & incomec2[j]<150000)
  {
    numc2 <- numc2+1
  }
  if(incomec2[j]>=150000)
  {
    numc3 <- numc3+1
  }
}
numx1 <- 0
numx2 <- 0
numx3 <- 0
for (j in 1:length(incomex2)) 
{
  if(incomex2[j]<30000)
  {
    numx1 <- numx1+1
  }
  if(incomex2[j]>=30000 & incomex2[j]<150000)
  {
    numx2 <- numx2+1
  }
  if(incomex2[j]>=150000)
  {
    numx3 <- numx3+1
  }
}
meanc <- mean(incomec2)
meanx <- mean(incomex2)
cat("numc1 is : ",numc1,"\n")
cat("numc2 is : ",numc2,"\n")
cat("numc3 is : ",numc3,"\n")
cat("numx1 is : ",numx1,"\n")
cat("numx2 is : ",numx2,"\n")
cat("numx3 is : ",numx3,"\n")
cat("The averagec is :",meanc,"\n")
cat("The averagex is :",meanx,"\n")