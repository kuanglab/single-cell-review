library(Seurat)
library(dplyr)
library(Matrix)
# Load the PBMC dataset

pbmc.data <- read.csv("data_sc3_seurat/A_100.csv", row.names = 1);

start_time <- Sys.time()

# Examine the memory savings between regular and sparse matrices
dense.size <- object.size(x = as.matrix(x = pbmc.data))
sparse.size <- object.size(x = pbmc.data)

mincell=0 # Keep all genes expressed in >= mincell cells (parameter)
mingene=0 # Keep all cells with at least mingene detected genes (parameter)

pbmc <- CreateSeuratObject(raw.data = pbmc.data, min.cells = 0, min.genes = 0, project = "10X_PBMC")
pbmc <- NormalizeData(object = pbmc, normalization.method = "LogNormalize", scale.factor = 100)

j=1.30; # a tunable parameter
results <- FindClusters(object = pbmc, resolution = j)

end_time <- Sys.time()
t = end_time - start_time
print(t)

name = "results_seurat/seurat_output.csv"
write.csv(results@ident, name);
