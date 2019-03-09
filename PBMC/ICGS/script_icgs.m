%% load data
load ../A_samples

%% Run ICGS
tic
mkdir('results_icgs/100/rho010');
system('python altanalyze/AltAnalyze.py --runICGS yes --platform RNASeq --species Hs --ChromiumSparseMatrix data_icgs/100/matrix.mtx --output results_icgs/100/rho010/ --column_method hopach --row_method hopach --removeOutliers no --rho 0.010');
toc

%% Parse output
% replace output.txt by the generated file inside results_icgs/100/rho010/ICGS/
r = readtable('output.txt');

[~,idx] = sort(table2array(r(1,3:end)));
c = table2array(r(2,3:end));
c = c(idx);

%% ARI
disp([' ARI=',num2str(rand_index(c, y_100, 'adjusted'))]);
