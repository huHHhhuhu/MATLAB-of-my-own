function [Endpoint_D,D,w]=DTW_3(t,r)
%Endpoint_D �O���I�̤p�ֿn�Z��
%D �O�U�I�̤p�ֿn�Z�����x�}�A�u�Ҽ{(0,+1),(+1,0),(+1,+1),(0,+2),(+2,0)���ب��k
%w �O�̨θ��|���O���x�}�A�Ѳ��I��_�I
%t �O�@��Nx12��test mfcc�x�}
%r �O�@��Mx12��reference mfcc�x�}

%=================�H�U�p��reference�Mtest�y��,����frames��12����mfcc�V�q,�������ڴX���o�Z���A�ñN���G�s�JNxM���x�}d��,�ݷ|recursion�|�Ψ�=================:
[N,~]=size(t);    %test
[M,~]=size(r);    %ref
d=zeros(N,M);

for n=1:N
    for m=1:M
        e=zeros(1,12);
        for i=1:12  %1~12dim
            e(1,i)=(t(n,i)-r(m,i))^2;
        end
        d(n,m)=sum(e);       %�ڴX���o�Z��������(�i��t�Z��j)
    end
end


%=================�H�U��Viterbi search��initialzation=================:
D=zeros(size(d));  %�ֿn�Z���x�}D
D(1,1)=d(1,1);
D(2,1)=d(2,1)+D(1,1);
D(1,2)=d(1,2)+D(1,1);
D(2,2)=d(2,2)+min([D(1,2),D(1,1),D(2,1)]);

for n=3:N
    D(n,1)=d(n,1)+min([D(n-1,1),D(n-2,1)]); %�o�����ֿn�ȥi�H(�ӦV�u���@��)�B��������(�ݷ|�����j�騺�Ψ�)
end

for m=3:M
    D(1,m)=d(1,m)+min([D(1,m-1),D(1,m-2)]); %�o�����ֿn�ȥi�H(�ӦV�u���@��)�B��������(�ݷ|�����j�騺�Ψ�)
end


%=================�H�U��Viterbi search��recursion,��X�U�Iminimum accumulate distance(�٥���e�Xoptimal path)=================:
for n=2:N  %�~�鴫��M,���鴫��N,�]�i
    for m=2:M
        if n >= 3 && m>=3
            D(n,m)=d(n,m)+min([D(n-1,m),D(n,m-1),D(n-1,m-1),D(n-2,m),D(n,m-2)]);
        elseif n==2 && m>2
            D(n,m)=d(n,m)+min([D(n-1,m),D(n,m-1),D(n-1,m-1),D(n,m-2)]);
        elseif n>2 && m==2
            D(n,m)=d(n,m)+min([D(n-1,m),D(n,m-1),D(n-1,m-1),D(n-2,m)]);
        end
    end
end


%=================��Viterbi search��termination,�o��minimum total accumulate distance=================:
Endpoint_D=min([D(fix(0.7*N):N,M)',D(N,fix(0.7*M):M)]); %�ϥΤp���I�L����˥h


%=================�H�U��Path Backtracking�A�ñN�̨θ��u�O���bw;�nback�Ӥ��q�Ytracking,�O�]���C�I�Ҧ��i�઺�e�@�B����"distance�ֿn��(D)"�i�Ѧ�,�ӱq�Ytrack�|�S��"����",�u��ݨ��̤p�Ȫ��U�@�B,���̫�o�쪺���|,�ֿn���Z���i�ण�O�Ҧ��i����|���̤p��.
n=N;    %test
m=M;    %ref
w=[];
w(1,:)=[N,M];

while ((n+m)~=2) %��=2,�N��F�Y
    if m>=3 && n>=3
        [~,column]=min([D(n-1,m),D(n,m-1),D(n-1,m-1),D(n-2,m),D(n,m-2)]);  %[�̤p��(�S�Ψ�i��~���N),�̤p�ȩҦb��]=...
        switch column
            case 1
                n=n-1;
            case 2
                m=m-1;
            case 3
                n=n-1;
                m=m-1;
            case 4
                n=n-2;
            case 5
                m=m-2;
        end
    elseif n==2 && m>2
        [~,column]=min([D(n-1,m),D(n,m-1),D(n-1,m-1),D(n,m-2)]);
        switch column
            case 1
                n=n-1;
            case 2
                m=m-1;
            case 3
                n=n-1;
                m=m-1;
            case 4
                m=m-2;
        end
    elseif n>2 && m==2
        [~,column]=min([D(n-1,m),D(n,m-1),D(n-1,m-1),D(n-2,m)]);
        switch column
            case 1
                n=n-1;
            case 2
                m=m-1;
            case 3
                n=n-1;
                m=m-1;
            case 4
                n=n-2;
        end
    elseif n==1 && m>2
        [~,column]=min([D(1,m-1),D(1,m-2)]);
        switch column
            case 1
                m=m-1;
            case 2
                m=m-2;
        end
    elseif m==1 && n>2
        [~,column]=min([D(n-1,1),D(n-2,1)]);
        switch column
            case 1
                n=n-1;
            case 2
                n=n-2;
        end
    elseif m==1 && n==2 %�U�@�B�@�w���^(1,1)
        n=1;
    elseif n==1 && m==2 %�U�@�B�@�w���^(1,1)
        m=1;
    elseif n==2 && m==2 %�U�@�B�@�w���^(1,1)
        n=1;
        m=1;                     
    end
    w=cat(1,w,[n,m]); %�N��쪺suboptimal path�O���U�ӡA�M���~���Y([1,1])��(by while);�i�g��w=[w;[n,m]];�i�H��w�e�X�̨θ��|
end