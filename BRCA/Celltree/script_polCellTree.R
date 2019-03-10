library(cellTree)

dat <- read.table('BRCA_all_samples_celltree_format.txt', header=FALSE, sep=" ")

start_time <- Sys.time()

lda.results = compute.lda(dat)
p <- get.cell.dists(lda.results)

end_time <- Sys.time()

write.csv(p, sprintf("celltree_all_samples_output.txt"));
