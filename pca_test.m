clear;
clc;
%% load data
load USPS.mat
%% compute the SVD of the data matrix
[U,S,V] = svd(A,0);
%% compute total reconstruction error for p = 10; 50; 100; 200
total_reconstruction_error = zeros(4,1);
p = [10; 50; 100; 200];
fprintf('p         | total reconstruction error\n');
fprintf('--------------------------------------\n');
for ii = 1:length(p)
    total_reconstruction_error(ii) = norm(A-U(:,1:p(ii))*S(1:p(ii),1:p(ii))*V(:,1:p(ii))','fro')^2;
    fprintf('%3d       | %e\n', p(ii),total_reconstruction_error(ii));
end
figure(1);
hold on
plot(p,total_reconstruction_error,'r.-','LineWidth',2,'MarkerSize',20);
xlabel('p','FontSize',12);
ylabel('total reconstruction error', 'FontSize',12);
hold off
%% show the first two reconstructed images for p = 10; 50; 100; 200
figure(2);
hold on
for ii = 1:2
    subplot(2,5,1+(ii-1)*(length(p)+1)), imshow(reshape(A(ii,:),16,16)');
    hold on
    title('original','FontSize',12);
    hold off
    for jj = 1:length(p)
        A1 = U(:,1:p(jj))*S(1:p(jj),1:p(jj))*V(:,1:p(jj))';
        A1 = reshape(A1(ii,:),16,16);
        subplot(2,5,jj+1+(ii-1)*(length(p)+1)), imshow(A1');
        hold on
        title(['p = ' num2str(p(jj))],'FontSize',12);
    end
end
hold off