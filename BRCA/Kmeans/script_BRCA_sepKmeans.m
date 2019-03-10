%% load data
load('../A_BRCA_filtered_5000.mat', 'A2', 'y23')
load('../A_BRCA_filtered_5000.mat', 'y23')

%% separated kmeans
res = {};
for i=1:5
    res{i} = zeros(size(A2{i},1),3);
    idx = kmeans(A2{i}, 3, 'Distance', 'correlation', 'Replicates', 1);
    for j=1:length(idx)
        res{i}(j,idx(j)) = 1;
    end
end

%% generate all possible permutations o the three cell types
ps = perms(1:3);
ps2 = perms(1:3);
for i=1:4
    [XX,YY] = meshgrid(1:size(ps2,1),1:size(ps,1));
    XX = XX(:);
    YY = YY(:);
    ps2 = [ps2(XX,:) ps(YY,:)];
end

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

