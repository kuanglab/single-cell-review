load ../A_samples

%% read output from celltree
idx = readtable('celltree_output.txt');
idx = table2array(idx(:,2:end));

%% run hierarchical clustering
tic
Z = linkage(idx,'ward');
idx = cluster(Z,'maxclust',10);
toc

%% ARI
disp(rand_index(idx, y_100, 'adjusted'));
