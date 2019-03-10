library(cellTree)

for (j in 1:5) {

    dat <- read.table(sprintf("BRCA_sample%d_celltree_format.txt", j), header=FALSE, sep=" ")

    start_time <- Sys.time()

    lda.results = compute.lda(dat)
    p <- get.cell.dists(lda.results)

    end_time <- Sys.time()

    write.csv(p, sprintf("celltree_sample%d_output.txt", j));

}
