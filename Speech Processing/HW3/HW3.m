%%
%畫histogram of MFCC1-MFCC2:

clear;clc;close;

%取mfcc檔資料:                                                      語者代號:
x1=readhtk('D:\NCTU\課程\語音處理\HW3\要抽語料\FCJF0\SA1.mfcc');     %FCJF0
x2=readhtk('D:\NCTU\課程\語音處理\HW3\要抽語料\FDAW0\SA1.mfcc');     %FDAW0
x3=readhtk('D:\NCTU\課程\語音處理\HW3\要抽語料\MCPM0\SA1.mfcc');     %MCPM0
x4=readhtk('D:\NCTU\課程\語音處理\HW3\要抽語料\MDAC0\SA1.mfcc');     %MDAC0

%histogram of MFCC1-MFCC2:
max_mfcc_of_all_people=max(max([x1;x2;x3;x4]));   %調查一下所有mfcc中最大值為何，以決定histogram軸的最大值
min_mfcc_of_all_people=min(min([x1;x2;x3;x4]));

%FCJF0:
figure(1) 
histndim(x1(:,1:2),[50 -40 40]','pz');
%view(2)
xlabel('MFCC1');
ylabel('MFCC2');
zlabel('所佔比例');
title('FCJF0 Histogram');

%FDAW0:
figure(2) 
histndim(x2(:,1:2),[50 -40 40]','pz');
%view(2)
xlabel('MFCC1');
ylabel('MFCC2');
zlabel('所佔比例');
title('FDAW0 Histogram');

%MCPM0:
figure(3) 
histndim(x3(:,1:2),[50 -40 40]','pz');
%view(2)
xlabel('MFCC1');
ylabel('MFCC2');
zlabel('所佔比例');
title('MCPM0 Histogram');

%MDAC0:
figure(4) 
histndim(x4(:,1:2),[50 -40 40]','pz');
%view(2)
xlabel('MFCC1');
ylabel('MFCC2');
zlabel('所佔比例');
title('MDAC0 Histogram');
%%
%GMM:

%說明[m1,v1,w1]=gaussmix(x1,[],[],8);
%GAUSSMIX fits a gaussian mixture pdf to a set of data observations [m,v,w,g,f]=(x,c,l,m0,v0,w0,wx)
%
% Usage:
%    (1) [m,v,w]=gaussmix(x,[],[],k);    % create GMM with k mixtures
%
% Inputs: n data values, k mixtures, p parameters, l loops
%
%     X(n,p)   Input data vectors, one per row.
% Outputs: (Note that M, V and W are omitted if L==0)
%
%     M(k,p)   Mixture means, one row per mixture. (omitted if L==0)
%     V(k,p)   Mixture variances, one row per mixture. (omitted if L==0)
%       or V(p,p,k) if full covariance matrices in use (i.e. either 'v' option or V0(p,p,k) specified)
%     W(k,1)   Mixture weights, one per mixture. The weights will sum to unity. (omitted if L==0)

%FCJF0:
[m1,v1,w1]=gaussmix(x1(:,1:2),[],[],8);     %每個Gaussian(1/8mixture)的每一維mfcc都有各自一個mean,variance
xx1=min(x1(:,1)):0.4:max(x1(:,1));
yy1=min(x1(:,2)):0.4:max(x1(:,2));
[X Y]=meshgrid(xx1,yy1);
[a b]=size(X);
 
for i=1:a
    for j=1:b
        Z(i,j)=exp(gmmlpdf([X(i,j) Y(i,j)],m1,v1,w1)); %gaussmixp也畫得出來;聽說本式[X(i,j) Y(i,j)]不用加也可
    end
end
 
figure;
surf(X,Y,Z);
title('FCJF0 GMM, mix=64');
xlabel('MFCC1');
ylabel('MFCC2');
%view(2)


%MCPM0:
[m3,v3,w3]=gaussmix(x3(:,1:2),[],[],8);      
xx3=min(x3(:,1)):0.4:max(x3(:,1));
yy3=min(x3(:,2)):0.4:max(x3(:,2));
[X3 Y3]=meshgrid(xx3,yy3);
[a b]=size(X3);
 
for i=1:a
    for j=1:b
        Z3(i,j)=exp(gmmlpdf([X3(i,j) Y3(i,j)],m3,v3,w3));   %gmmlpdf的output是"log" PDF values,因此要exp還原值、畫出原圖
    end
end
 
figure;
surf(X3,Y3,Z3);
title('MCPM0 GMM, mix=8');
xlabel('MFCC1');
ylabel('MFCC2');
%view(2)





%%
%test:
%--------------------------各自GMM--------------------------
[M(:,:,1),V(:,:,1),W(:,1)]=gaussmix(x1(:,1:13),[],[],8,'hf');   %FCJF0
[M(:,:,2),V(:,:,2),W(:,2)]=gaussmix(x2(:,1:13),[],[],8,'hf');   %FDAW0
[M(:,:,3),V(:,:,3),W(:,3)]=gaussmix(x3(:,1:13),[],[],8,'hf');   %MCPM0
[M(:,:,4),V(:,:,4),W(:,4)]=gaussmix(x4(:,1:13),[],[],8,'hf');   %MDAC0

%--------------------------提取test語料--------------------------
test1=readhtk('D:\NCTU\課程\語音處理\HW3\要抽語料\FCJF0\SA2.mfcc');     %FCJF0
test2=readhtk('D:\NCTU\課程\語音處理\HW3\要抽語料\FDAW0\SA2.mfcc');     %FDAW0
test3=readhtk('D:\NCTU\課程\語音處理\HW3\要抽語料\MCPM0\SA2.mfcc');     %MCPM0
test4=readhtk('D:\NCTU\課程\語音處理\HW3\要抽語料\MDAC0\SA2.mfcc');     %MDAC0

%--------------------------計算log機率--------------------------
for i=1:4    %4個speaker
    log_prob1(i)=sum(gmmlpdf(test1(:,1:13),M(:,:,i),V(:,:,i),W(:,i)));  
    log_prob2(i)=sum(gmmlpdf(test2(:,1:13),M(:,:,i),V(:,:,i),W(:,i)));  
    log_prob3(i)=sum(gmmlpdf(test3(:,1:13),M(:,:,i),V(:,:,i),W(:,i)));  
    log_prob4(i)=sum(gmmlpdf(test4(:,1:13),M(:,:,i),V(:,:,i),W(:,i)));  
end

[max_log_prob1 choose1]=max(log_prob1);  
[max_log_prob2 choose2]=max(log_prob2);   
[max_log_prob3 choose3]=max(log_prob3);   
[max_log_prob4 choose4]=max(log_prob4);   
