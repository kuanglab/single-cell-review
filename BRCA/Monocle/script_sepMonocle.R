library(monocle)

for (sample in 1:5) {
    dataset <- read.table(sprintf("BRCA_sample%d_celltree_format.txt", sample))
    dataset <- as.matrix(dataset)

    start_time <- Sys.time()

    data <- newCellDataSet(dataset)
    data <- estimateSizeFactors(data)
    data <- reduceDimension(data, max_components = 2, num_dim = 3, reduction_method = 'tSNE', verbose = T, check_duplicates = F, perplexity = 3)
    data <- clusterCells(data, num_clusters = 3)

    end_time <- Sys.time()
    t <- t + (end_time - start_time)

    # write.csv(data$Cluster, sprintf("monocle_sample%d.txt", sample));

}

print(t)
