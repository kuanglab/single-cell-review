# Machine Learning and Statistical Methods for Clustering Single Cell RNA-sequencing Data

Comparison among several scRNA-Seq clustering algorithms under two datasets:

### PBMC dataset

Dataset was downloaded from [1], containing subpopulations of peripheral blood mononuclear cells (PBMC) from a fresh donor (Donor A). The 19,630 genes used are expressed in at least 3 cells.

The following methods were compared:

- k-Means
- BackSPIN [2]
- cellTree [3]
- CIDR [4]
- DendroSplit [5]
- ICGS [6]
- pcaReduce [7]
- SC3 [8]
- SCRAT [9]
- Seurat 1.0 [10]
- SNN-Cliq [11]

Source code can be found at the `PBMC` folder, and it assumes you have each method installed the machine. Source code was implemented in MATLAB 2018a.

Dataset processed for each method can be download at: 

### Breast cancer dataset

Dataset was downloaded from [12], containing 515 cells of 11 patients with breast cancer. We extracted the top 5,000 differentially expressed genes. Cells are in three groups: Immune, Stromal or Tumor. We used 5 patients that contain cells of the three groups, with 212 cells in total.

The following methods were compared:

- Seurat 2.0 [13]
- scVDMC [14]

Source code can be found at the `BRCA` folder, and it assumes you have each method installed the machine. Source code was implemented in MATLAB 2018a.

Dataset processed for each method can be download at: 

### References

[1] Zheng, Grace XY, Jessica M. Terry, Phillip Belgrader, Paul Ryvkin, Zachary W. Bent, Ryan Wilson, Solongo B. Ziraldo et al. "Massively parallel digital transcriptional profiling of single cells." Nature communications 8 (2017): 14049.

[2] Zeisel, Amit, Ana B. Muñoz-Manchado, Simone Codeluppi, Peter Lönnerberg, Gioele La Manno, Anna Juréus, Sueli Marques et al. "Cell types in the mouse cortex and hippocampus revealed by single-cell RNA-seq." Science 347, no. 6226 (2015): 1138-1142.

[3] Yotsukura, Sohiya, Seitaro Nomura, Hiroyuki Aburatani, and Koji Tsuda. "CellTree: an R/bioconductor package to infer the hierarchical structure of cell populations from single-cell RNA-seq data." BMC bioinformatics 17, no. 1 (2016): 363.

[4] Lin, Peijie, Michael Troup, and Joshua WK Ho. "CIDR: Ultrafast and accurate clustering through imputation for single-cell RNA-seq data." Genome biology 18, no. 1 (2017): 59.

[5] Zhang, Jesse M., Jue Fan, H. Christina Fan, David Rosenfeld, and N. Tse David. "An interpretable framework for clustering single-cell RNA-Seq datasets." BMC bioinformatics 19, no. 1 (2018): 93.

[6] Olsson, Andre, Meenakshi Venkatasubramanian, Viren K. Chaudhri, Bruce J. Aronow, Nathan Salomonis, Harinder Singh, and H. Leighton Grimes. "Single-cell analysis of mixed-lineage states leading to a binary cell fate choice." Nature 537, no. 7622 (2016): 698.

[7] Yau, Christopher. "pcaReduce: hierarchical clustering of single cell transcriptional profiles." BMC bioinformatics 17, no. 1 (2016): 140.

[8] Kiselev, Vladimir Yu, Kristina Kirschner, Michael T. Schaub, Tallulah Andrews, Andrew Yiu, Tamir Chandra, Kedar N. Natarajan et al. "SC3: consensus clustering of single-cell RNA-seq data." Nature methods 14, no. 5 (2017): 483.

[9] Camp, J. Gray, Keisuke Sekine, Tobias Gerber, Henry Loeffler-Wirth, Hans Binder, Malgorzata Gac, Sabina Kanton et al. "Multilineage communication regulates human liver bud development from pluripotency." Nature 546, no. 7659 (2017): 533.

[10] Satija, Rahul, Jeffrey A. Farrell, David Gennert, Alexander F. Schier, and Aviv Regev. "Spatial reconstruction of single-cell gene expression data." Nature biotechnology 33, no. 5 (2015): 495.

[11] Xu, Chen, and Zhengchang Su. "Identification of cell types from single-cell transcriptomes using a novel clustering method." Bioinformatics 31, no. 12 (2015): 1974-1980.

[12] Chung, Woosung, Hye Hyeon Eum, Hae-Ock Lee, Kyung-Min Lee, Han-Byoel Lee, Kyu-Tae Kim, Han Suk Ryu et al. "Single-cell RNA-seq enables comprehensive tumour and immune cell profiling in primary breast cancer." Nature communications 8 (2017): 15081.

[13] Butler, Andrew, Paul Hoffman, Peter Smibert, Efthymia Papalexi, and Rahul Satija. "Integrating single-cell transcriptomic data across different conditions, technologies, and species." Nature biotechnology 36, no. 5 (2018): 411.

[14] Zhang, Huanan, Catherine AA Lee, Zhuliu Li, John R. Garbe, Cindy R. Eide, Raphael Petegrosso, Rui Kuang, and Jakub Tolar. "A multitask clustering approach for single-cell RNA-seq analysis in Recessive Dystrophic Epidermolysis Bullosa." PLoS computational biology 14, no. 4 (2018): e1006053.
