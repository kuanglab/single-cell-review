%% load data
load ../A_samples

%% load results
r = readtable(['sc3_output.csv']);

%% ARI
disp(['ARI=',num2str(rand_index(r.sc3_10_clusters, y_100, 'adjusted'))]);
