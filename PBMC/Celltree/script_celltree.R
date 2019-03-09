library(cellTree)

dat <- read.table('data_celltree/A_100.txt', header=FALSE, sep=" ")

start_time <- Sys.time()

lda.results = compute.lda(dat)
p <- get.cell.dists(lda.results)

end_time <- Sys.time()
print(end_time - start_time)

write.csv(p, "celltree_output.txt");
