%% load data
load('A_BRCA_filtered_5000.mat', 'y23')

%% load results
a = readtable('seurat_output_BRCA.csv');
x = a.x;

%% combine labels
yy = [];
for i=1:5
    yy = [yy;y23{i}];
end

%% ari
fprintf('ARI=%f\n', rand_index(x,yy,'adjusted'));
