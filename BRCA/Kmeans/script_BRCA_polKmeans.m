%% load data
load('A_BRCA_filtered_5000.mat', 'A2')
load('A_BRCA_filtered_5000.mat', 'y3')

%% combine labels
A = [];
y2 = [];
for i=1:5
    A = [A; A2{i}];
    y2 = [y2; y23{i}];
end

%% pooled kmeans
res = kmeans(A, 3, 'Distance', 'correlation', 'Replicates', 1);

%% ARI
rand_index(res,y2,'adjusted')
