%% load data
load ../A_samples

%% load results
r = readtable(['pcaReduce_output.txt']);

%% ARI
disp(['ARI=',num2str(rand_index(c, y_100, 'adjusted'))]);
