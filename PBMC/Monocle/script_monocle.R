library(monocle)

tt = c()

dataset <- read.table('data_cidr/A_100.txt')
dataset <- as.matrix(dataset)

start_time <- Sys.time()

data <- newCellDataSet(dataset)
data <- estimateSizeFactors(data)
data <- reduceDimension(data, max_components = 3, num_dim = 10, reduction_method = 'tSNE', verbose = T, check_duplicates = F)
data <- clusterCells(data, num_clusters = 10)

end_time <- Sys.time()
t = end_time - start_time
print(t)

write.csv(data$Cluster, sprintf("monocle_output.txt"));

