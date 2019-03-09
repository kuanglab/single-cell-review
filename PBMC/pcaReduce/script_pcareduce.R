library("pcaReduce")

tags <- read.table('data_pcareduce/A_100.txt')
tags <- as.matrix(tags)

D <- log2(tags + 1)
Input <- t(D)
start_time <- Sys.time()
Output_S <- PCAreduce(Input, nbt=1, q=9, method='S')
end_time <- Sys.time()

print(end_time - start_time)

write.csv(Output_S[1], "results_pcareduce/pcaReduce_output.txt");
