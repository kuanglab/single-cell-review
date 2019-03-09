library(SingleCellExperiment)
library(SC3)

GeneExpData <- read.csv("data_sc3_seurat/A_100.csv", row.names = 1);
cellNames <- read.csv("data_sc3_seurat/barcodes_100.csv", row.names = 1);

start_time <- Sys.time()

# create a SingleCellExperiment object
sce <- SingleCellExperiment(
  assays = list(
    counts = as.matrix(GeneExpData),
    logcounts = log2(as.matrix(GeneExpData) + 1)
  ), 
  colData = cellNames
)

# define feature names in feature_symbol column
rowData(sce)$feature_symbol <- rownames(sce)
# remove features with duplicated names
sce <- sce[!duplicated(rowData(sce)$feature_symbol), ]
# define spike-ins
isSpike(sce, "ERCC") <- grepl("ERCC", rowData(sce)$feature_symbol)

# run SC3 with ks clusters
# sce <- sc3(sce, ks = 10, biology = FALSE, svm_num_cells = 5000)
# sce_svm <- sc3_run_svm(sce, ks = 10)
sce <- sc3(sce, ks = 10, biology = FALSE, rand_seed = sample(1:10000,1))

# cell results
col_data <- colData(sce)
# col_data <- colData(sce_svm)

end_time <- Sys.time()
print(end_time - start_time)

# write results
fileName="results_sc3/sc3_output.csv"
write.csv(col_data, fileName);
