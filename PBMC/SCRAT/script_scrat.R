library(scrat)

data <- read.table("data_scrat/A_100.txt")

start_time <- Sys.time()

env <- scrat.new(list(dataset.name="Scrat 100 30 x 30 dmap", dim.1stLvlSom = 30, count.processing = TRUE, pseudotime.estimation=NULL))
env$indata <- data

set.seed(i)

res <- scrat.run(env)

end_time <- Sys.time()
t = end_time - start_time
print(t)

name = "results_scrat/scrat_output.csv"
write.csv(env$group.labels, name);
