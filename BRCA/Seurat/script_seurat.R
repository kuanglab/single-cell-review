################################################################################
### Alignment workflow for the four human pancreatic islet datasets
################################################################################

library(Seurat)
library(Matrix)

# Read in all four input expression matrices
patient4.data <- read.csv("data_seurat/A_BRCA_5000_patient1.csv", row.names = 1);
patient6.data <- read.csv("data_seurat/A_BRCA_5000_patient2.csv", row.names = 1);
patient7.data <- read.csv("data_seurat/A_BRCA_5000_patient3.csv", row.names = 1);
patient8.data <- read.csv("data_seurat/A_BRCA_5000_patient4.csv", row.names = 1);
patient10.data <- read.csv("data_seurat/A_BRCA_5000_patient5.csv", row.names = 1);

start_time <- Sys.time()

# Convert to sparse matrices for efficiency
patient4.data <- as(as.matrix(patient4.data), "dgCMatrix")
patient6.data <- as(as.matrix(patient6.data), "dgCMatrix")
patient7.data <- as(as.matrix(patient7.data), "dgCMatrix")
patient8.data <- as(as.matrix(patient8.data), "dgCMatrix")
patient10.data <- as(as.matrix(patient10.data), "dgCMatrix")

# Create and setup Seurat objects for each dataset
patient4 <- CreateSeuratObject(raw.data = patient4.data)
patient4 <- NormalizeData(patient4)
# celseq2 <- FilterCells(celseq2, subset.names = "nGene", low.thresholds = 2500)
patient4 <- FindVariableGenes(patient4, do.plot = F, display.progress = F)
patient4 <- ScaleData(patient4)
patient4@meta.data$tech <- "patient4"

patient6 <- CreateSeuratObject(raw.data = patient6.data)
patient6 <- NormalizeData(patient6)
# celseq2 <- FilterCells(celseq2, subset.names = "nGene", low.thresholds = 2500)
patient6 <- FindVariableGenes(patient6, do.plot = F, display.progress = F)
patient6 <- ScaleData(patient6)
patient6@meta.data$tech <- "patient6"

patient7 <- CreateSeuratObject(raw.data = patient7.data)
patient7 <- NormalizeData(patient7)
# celseq2 <- FilterCells(celseq2, subset.names = "nGene", low.thresholds = 2500)
patient7 <- FindVariableGenes(patient7, do.plot = F, display.progress = F)
patient7 <- ScaleData(patient7)
patient7@meta.data$tech <- "patient7"

patient8 <- CreateSeuratObject(raw.data = patient8.data)
patient8 <- NormalizeData(patient8)
# celseq2 <- FilterCells(celseq2, subset.names = "nGene", low.thresholds = 2500)
patient8 <- FindVariableGenes(patient8, do.plot = F, display.progress = F)
patient8 <- ScaleData(patient8)
patient8@meta.data$tech <- "patient8"

patient10 <- CreateSeuratObject(raw.data = patient10.data)
patient10 <- NormalizeData(patient10)
# celseq2 <- FilterCells(celseq2, subset.names = "nGene", low.thresholds = 2500)
patient10 <- FindVariableGenes(patient10, do.plot = F, display.progress = F)
patient10 <- ScaleData(patient10)
patient10@meta.data$tech <- "patient10"

print("Determine genes")
# Determine genes to use for CCA, must be highly variable in at least 2 datasets
ob.list <- list(patient4, patient6, patient7, patient8, patient10)
genes.use <- c()
for (i in 1:length(ob.list)) {
genes.use <- c(genes.use, head(rownames(ob.list[[i]]@hvg.info), 1600))
}
genes.use <- names(which(table(genes.use) > 1))
for (i in 1:length(ob.list)) {
genes.use <- genes.use[genes.use %in% rownames(ob.list[[i]]@scale.data)]
}

print("Run multi-set CCA")
# Run multi-set CCA
brca.integrated <- RunMultiCCA(ob.list, genes.use = genes.use, num.ccs = 13)

print("CC Selection")
# CC Selection
MetageneBicorPlot(brca.integrated, grouping.var = "tech", dims.eval = 1:2)

# Run rare non-overlapping filtering
brca.integrated <- CalcVarExpRatio(object = brca.integrated, reduction.type = "pca", grouping.var = "tech", dims.use = 1:2)
brca.integrated <- SubsetData(brca.integrated, subset.name = "var.ratio.pca")

# Alignment
brca.integrated <- AlignSubspace(brca.integrated, reduction.type = "cca", grouping.var = "tech", dims.align = 1:2)

# t-SNE and Clustering
brca.integrated <- FindClusters(brca.integrated, reduction.type = "cca.aligned", dims.use = 1:i, save.SNN = T, resolution = 0.2)

end_time <- Sys.time()
t <- end_time - start_time
print(t)

name = sprintf('seurat_output_BRCA.csv')
write.csv(brca.integrated@ident, name);
