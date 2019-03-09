from dendrosplit import split,merge
import pickle,h5py
import pandas as pd
import numpy as np
import sys

def load_mat_h5f(flname):
    h5f = h5py.File(flname,'r')
    X = h5f['dataset_1'][:]
    h5f.close()
    return X

X = load_mat_h5f(sys.argv[1])
genes = np.loadtxt(sys.argv[2],dtype=str)
print('%s cells, %s features loaded'%np.shape(X))

# Remove columns of X that sum to 0
X,genes = split.filter_genes(X,genes)

# DropSeq approach to gene selection
keep_inds = split.dropseq_gene_selection(np.log(1+X),z_cutoff=1.5,bins=5)
X,genes = X[:,keep_inds],genes[keep_inds]
print('Kept %s features after DropSeq gene selection step.'%(len(X[0])))

D = split.log_correlation(X)
D[np.isnan(D)] = 0;

ys,shistory = split.dendrosplit((D,X), preprocessing='precomputed', score_threshold=float(sys.argv[4]), verbose=True, disband_percentile=50)
ym,mhistory = merge.dendromerge((D,X),ys,score_threshold=float(sys.argv[5]),preprocessing='precomputed', verbose=True,outlier_threshold_percentile=90)

np.savetxt(sys.argv[3],ym,fmt='%s')
