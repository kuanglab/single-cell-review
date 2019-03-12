%% load data
load('A_BRCA_filtered_5000.mat', 'A2')
load('A_BRCA_filtered_5000.mat', 'y3')

%% combine labels
A = [];
y2 = [];
for i=1:5
    i
    A = [A; A2{i}];
    y2 = [y2; y23{i}];
end

%% load results
idx = readtable(strcat('monocle_all_samples.txt'));

%% ARI
rand_index(idx.x,y2,'adjusted')
