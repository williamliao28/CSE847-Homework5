% this test script for my k-means and spectral relaxation k-means use an
% example described in MATLAB kmeans documentation
clear;
clc;
%% generate test data
rng('default') % For reproducibility
X = [randn(100,2)*0.75+ones(100,2);
    randn(100,2)*0.5-ones(100,2);
    randn(100,2)*0.75];
%% test k-meeans
[idx,C] = kmeans_cluster(X,3);
%% plot result
figure(1);
gscatter(X(:,1),X(:,2),idx,'bgm');
hold on
plot(C(:,1),C(:,2),'kx','MarkerSize',10,'LineWidth',2);
legend('Cluster 1','Cluster 2','Cluster 3','Cluster Centroid')
hold off
%% test spectral relaxation k-meeans
[idx,C] = kmeans_relax(X,3);
%% plot result
figure(2);
gscatter(X(:,1),X(:,2),idx,'bgm');
hold on
plot(C(:,1),C(:,2),'kx','MarkerSize',10,'LineWidth',2);
legend('Cluster 1','Cluster 2','Cluster 3','Cluster Centroid');
hold off