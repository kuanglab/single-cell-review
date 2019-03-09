%% load data
load ../A_samples

%% run SNN-Cliq
tic; 
SNN(A_100,'snn_tmp.txt', 4,'euclidean'); 
system(['python ./Cliq.py -i snn_tmp.txt -o snn_output.txt']);
delete('snn_tmp.txt');
toc

%% ARI
idx = dlmread(['snn_output.txt']);
disp(['ARI=',num2str(rand_index(idx, y_100, 'adjusted'))]);
