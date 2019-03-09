library(cidr)

tags <- read.table('data_cidr/A_100.txt')
tags <- as.matrix(tags)

start_time <- Sys.time()

sData <- scDataConstructor(tags)
sData <- determineDropoutCandidates(sData)
sData <- wThreshold(sData)
sData <- scDissim(sData)
sData <- scPCA(sData)
sData <- nPC(sData)
sData <- scCluster(sData, nCluster = 10)

end_time <- Sys.time()

write.csv(sData@clusters, "results_cidr/cidr_output.txt");
