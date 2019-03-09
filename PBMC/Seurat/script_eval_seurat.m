%% load data
load ../A_samples

%% load results
r = readtable(['seurat_output.csv']);

%% ARI
disp(['ARI=',num2str(rand_index(r.x, y_100, 'adjusted'))]);
