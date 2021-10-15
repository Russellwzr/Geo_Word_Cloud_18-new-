function [Dir,res] = PCA(Data)
% ��[-pi/2,pi/2]֮��ĽǶ�pi��ʾ����
% 1.ȥ����ֵ
[buf K] = size(Data);
miu = mean(Data')';
for k=1:K
    Data(:,k) = Data(:,k)-miu; 
end;
sigma = zeros(2,2);
% 2.����Э����
for k=1:K
    x = Data(:,k);
    sigma = sigma+x*x';
end;
sigma = sigma/K;  
% 3.�����ֽ�
[V,D] = eig(sigma);
if (D(1,1)<D(2,2)) % �ѽϴ������ֵ��Ӧ������Ų����һ��
     buf = V(1,:);
     V(1,:) = V(2,:);
     V(2,:) = buf;
end;
% 4.�������������
res = inv(V)*[1;0];
Dir = atan(res(2)/res(1))/pi*180;