
#indir="/Users/maryallen/srworkshop/projectB/day07/mnm_activity/"
indir="~/srworkshop/projectB/day07/mnm_activity/"
infile = "bowldf.csv"
#howmanyreads = 100
#whichbowl = "redbowl" #other option is greenbowl

args = commandArgs(trailingOnly=TRUE)

howmanyreads = args[1]
whichbowl = args[2]

#don't edit stuff below

grabahandful <- function(whichbowl, howmanyreads){
  bowls = read.csv(paste(indir, infile, sep=""))
  if (whichbowl=="redbowl"){
    samp_idx <- sample(seq_len(nrow(bowls)), howmanyreads, prob = bowls$redbowl, replace = TRUE)
    
  } else {
    samp_idx <- sample(seq_len(nrow(bowls)), howmanyreads, prob = bowls$greenbowl, replace = TRUE)
  }
  new_data <- bowls[samp_idx, ] 
  handful = table(new_data$name)
  return(handful)}

handful <- grabahandful(whichbowl, howmanyreads)
print(handful)

