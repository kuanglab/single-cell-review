library(TSCAN)

start_time <- Sys.time()
data <- read.table("data_tscan/A_100.txt")
procdata <- preprocess(data, takelog = F)
lpsmclust <- exprmclust(procdata, reduce = T, clusternum = 10:10)
end_time <- Sys.time()
t = end_time - start_time
print(t)

name = "results_tscan/tscan_output.csv"
write.csv(results@ident, name);
