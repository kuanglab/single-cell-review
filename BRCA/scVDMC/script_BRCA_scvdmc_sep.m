%% load data
load('../A_BRCA_filtered_5000.mat', 'A2')
load('../A_BRCA_filtered_5000.mat', 'y23')

%% prepare initialization from separate kmeans
U_ini = {};
V_ini = {};
A3 = {};
for i=1:5
    idx = kmeans(A2{i}, 3, 'Distance', 'correlation', 'Replicates', 1000);
    A3{i} = A2{i}';
    V_ini{i} = zeros(length(idx),3);
    U_ini{i} = zeros(size(A2{1},2),3);
    for k=1:3
        U_ini{i}(:,k) = mean(A2{i}(idx == k,:))';
        V_ini{i}(idx == k,k) = 1;
    end
end

%% scvdmc
k=3;
lambda = 500;
alpha = 10;
w = 1;

tic
[U, V, B, sortB, obj] = scVDMC(A3, 5, k, w, lambda, alpha, U_ini, V_ini, 100);
toc

res = V;

%% scvdmc
ps = perms(1:3);
ps2 = perms(1:3);
for i=1:4
    [XX,YY] = meshgrid(1:size(ps2,1),1:size(ps,1));
    XX = XX(:);
    YY = YY(:);
    ps2 = [ps2(XX,:) ps(YY,:)];
end

%% generate all possible permutations o the three cell types
ps = {};
for i=1:size(ps2,1)
    for j=1:5
        ps{i,j} = ps2(i,(j-1)*3+1:(j-1)*3+3);
    end
end

%% ARI
aris = [];
for i=1:size(ps,1)
    res2 = [];
    y232 = [];
    for j=1:5
        res2 = [res2; sum(res{j}.*ps{i,j},2)];
        y232 = [y232; y23{j}];
    end
    aris(i) = rand_index(res2,y232,'adjusted');
end

%% get the maximum ari from all permutations
max(aris)
