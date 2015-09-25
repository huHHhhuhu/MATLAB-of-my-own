function [Endpoint_D,D,w]=DTW(t,r)
%Endpoint_D 是終點最小累積距離
%D 是各點最小累積距離的矩陣，只考慮(0,+1),(+1,0)及(+1,+1)三種走法
%w 是最佳路徑的記錄矩陣，由終點到起點
%t 是一個Nx12的test mfcc矩陣
%r 是一個Mx12的reference mfcc矩陣

%=================以下計算reference和test語料,彼此frames的12維的mfcc向量,之間的歐幾里得距離，並將結果存入NxM的矩陣d當中,待會recursion會用到=================:
[N,~]=size(t);
[M,~]=size(r);
d=zeros(N,M);

for n=1:N
    for m=1:M
        e=zeros(1,12);
        for i=1:12  %1~12dim
            e(1,i)=(t(n,i)-r(m,i))^2;
        end
        d(n,m)=sum(e);           %歐幾里得距離的平方(可把差距放大)
    end
end


%=================以下做Viterbi search的initialzation=================:
D=zeros(size(d));  %累積距離矩陣D
D(1,1)=d(1,1);

for n=2:N
    D(n,1)=d(n,1)+D(n-1,1); %這部分累積值可以(來向只有一種)且必須先做(待會雙重迴圈那用到)
end

for m=2:M
    D(1,m)=d(1,m)+D(1,m-1); %這部分累積值可以(來向只有一種)且必須先做(待會雙重迴圈那用到)
end


%=================以下做Viterbi search的recursion,算出各點minimum accumulate distance(還未能畫出optimal path)=================:
for n=2:N  %外圈換成M,內圈換成N,也可
    for m=2:M
        D(n,m)=d(n,m)+min([D(n-1,m),D(n-1,m-1),D(n,m-1)]);  %只能走(0,+1),(+1,0),(+1,+1)
    end
end

%做Viterbi search的termination,得到minimum total accumulate distance:
Endpoint_D=D(N,M);


%=================以下做Path Backtracking，並將最佳路線記錄在w;要back而不從頭tracking,是因為每點所有可能的前一步都有"distance累積值(D)"可參考,而從頭track會沒有"遠見",只能看見最小值的下一步,但最後得到的路徑,累積的距離可能不是所有可能路徑中最小的.
n=N;    %test
m=M;    %ref
w=[];
w(1,:)=[N,M];

while ((n+m)~=2) %當=2,就到了頭
    if (n-1)==0 %n=1,到了邊框
        m=m-1;
    elseif (m-1)==0  %m=1,到了邊框
        n=n-1;
    else
        [~,column]=min([D(n-1,m),D(n,m-1),D(n-1,m-1)]);  %[最小值(沒用到可用~取代),最小值所在欄]=...
        switch column
            case 1
                n=n-1;
            case 2
                m=m-1;
            case 3
                n=n-1;
                m=m-1;
        end
    end
    w=cat(1,w,[n,m]); %將找到的suboptimal path記錄下來，然後繼續往頭([1,1])找(by while);可寫成w=[w;[n,m]];可以用w畫出最佳路徑
end