function [idx,C] = kmeans_relax(X , K)
[~,p] = size(X);
% solve eigenvalue problem
%[V,~] = eigs(X*X.' , K);
%[idx,~] = kmeans_cluster(V,K);
% compute SVD
[U,~,~] = svd(X);
[idx,~] = kmeans_cluster(U(1:K,:).',K);
% recover center
C = zeros(K,p);
for ii = 1:K
    C(ii,:) = ones(1,length(find(idx==ii)))*X(idx==ii,:)/length(find(idx==ii));
end