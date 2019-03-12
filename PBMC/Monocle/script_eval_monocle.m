%% load data
load ../A_samples y_100

%% load results
r = readtable('monocle_output.txt');

%% ari
rand_index(r.x, y_100, 'adjusted')
