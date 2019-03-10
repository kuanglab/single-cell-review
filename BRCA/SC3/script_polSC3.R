library(SingleCellExperiment)
library(SC3)
library(scater)

GeneExpData <- read.csv("BRCA_all_samples_sc3_format.txt", row.names = 1);
cellNames <- read.csv("BRCA_all_samples_sc3_barcodes.txt", row.names = 1);

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
set.seed(1)
sce <- sc3(sce, ks = 3, biology = TRUE, rand_seed = sample(1:10000,1))

# cell results
col_data <- colData(sce)

end_time <- Sys.time()

# write results
fileName = sprintf("sc3_all_samples.csv")
write.csv(col_data, fileName);

