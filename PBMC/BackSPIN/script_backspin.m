%% load data
load A_samples

%% run backspin
output = 'output.txt';
tic
system(['mypath/backspin -i data_backspin/A_100.cef -o ', output, ' -f 5000 -d 4 -v']);
toc

%% filter clustering results
system(['head -n 8 ', output, ' > tmp.txt']);

%% order cells according to original order
res = readtable('tmp.txt','HeaderLines',2);
delete('tmp.txt');
cellnum = table2array(res(1,8:end));
[~,idx] = sort(cellnum);

c = table2array(res(end,8:end));
c = c(idx);

%% ARI
disp(['ARI=',num2str(rand_index(c, y_100, 'adjusted'))]);
