%% load data
load('../A_BRCA_filtered_5000.mat', 'A2')
load('../A_BRCA_filtered_5000.mat', 'y3')

%% combine labels
A = [];
y2 = [];
for i=1:5
    i
    A = [A; A2{i}];
    y2 = [y2; y23{i}];
end

%% load results
idx = readtable(strcat('celltree_all_samples_output.txt'));
idx = table2array(idx(:,2:end));
Z = linkage(idx,'ward');
idx = cluster(Z,'maxclust',3);

%% ARI
rand_index(idx,y2,'adjusted')
