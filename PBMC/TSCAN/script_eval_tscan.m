%% load data
load ../A_samples

%% load results
r = readtable(['tscan_output.csv']);

%% ARI
disp(['ARI=',num2str(rand_index(r.x, y, 'adjusted'))]);
