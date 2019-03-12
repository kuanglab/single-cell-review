library(monocle)

dataset <- read.table(sprintf("BRCA_all_samples_celltree_format.txt"))
dataset <- as.matrix(dataset)

start_time <- Sys.time()

data <- newCellDataSet(dataset)
data <- estimateSizeFactors(data)
data <- reduceDimension(data, max_components = 2, num_dim = 3, reduction_method = 'tSNE', verbose = T, check_duplicates = F, perplexity = 3)
data <- clusterCells(data, num_clusters = 3)

end_time <- Sys.time()
t = end_time - start_time
print(t)

write.csv(data$Cluster, sprintf("monocle_all_samples.txt"));
