%% load data
load ../A_samples

%% Run DendroSplit
tic
system('python ./DendroSplit.py data_dendrosplit/A_100.h5 data_dendrosplit/genes.txt results_dendrosplit/output.txt');
toc

%% ARI
idx = dlmread(['results_dendrosplit/output.txt']);
disp(['ARI=',num2str(rand_index(idx, y_100, 'adjusted'))]);
