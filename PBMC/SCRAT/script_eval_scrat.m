%% load data
load ../A_samples

%% load results
r = readtable('scrat_output.csv');

%% ARI
[~,idx] = sort(cellfun(@(x) str2num(x), strrep(r.Var1, 'V', '')));
disp(['ARI=',num2str(rand_index(r.x(idx), y_100, 'adjusted'))]);
