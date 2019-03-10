%% load data
load('A_BRCA_filtered_5000.mat', 'A2')
load('A_BRCA_filtered_5000.mat', 'y3')

%% combine labels
y2 = [];
for i=1:5
    y2 = [y2; y23{i}];
end

%% load results
idx = readtable(strcat('sc3_all_samples_output.csv'));
idx = idx.sc3_3_clusters;
idx = cellfun(@(x) str2double(x(1)), idx);

%% ARI
rand_index(idx,y2,'adjusted')
