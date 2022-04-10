function [idx,C] = kmeans_cluster(X , K)
%% initialization
[n,~] = size(X);
C = X(randi(n,K,1),:);
maxiter = 100;
tol = 1e-3;
change = inf;

%% start loop
ii = 1;
while ii <= maxiter && change > tol
    Y = zeros(n,K);
    for jj = 1:K
        Y(:,jj) = sum((X-C(jj,:)).^2,2);
    end
    [~,idx] = min(Y,[],2);
    M = sparse(idx,1:n,1,K,n,length(idx));
    C_old = C;
    C = (M*X)./sum(M,2);
    change = norm(C-C_old);
    fprintf('ii = %d, change = %e\n', ii, change);
    ii = ii + 1;
end
