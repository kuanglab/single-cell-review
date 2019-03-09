%% load data
load ../A_samples

%% load output
res = readtable('cidr_output.txt');

%% ARI
disp(rand_index(res.x, y_100, 'adjusted'));
