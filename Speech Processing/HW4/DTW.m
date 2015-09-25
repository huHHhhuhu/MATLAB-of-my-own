function [Endpoint_D,D,w]=DTW(t,r)
%Endpoint_D �O���I�̤p�ֿn�Z��
%D �O�U�I�̤p�ֿn�Z�����x�}�A�u�Ҽ{(0,+1),(+1,0)��(+1,+1)�T�ب��k
%w �O�̨θ��|���O���x�}�A�Ѳ��I��_�I
%t �O�@��Nx12��test mfcc�x�}
%r �O�@��Mx12��reference mfcc�x�}

%=================�H�U�p��reference�Mtest�y��,����frames��12����mfcc�V�q,�������ڴX���o�Z���A�ñN���G�s�JNxM���x�}d��,�ݷ|recursion�|�Ψ�=================:
[N,~]=size(t);
[M,~]=size(r);
d=zeros(N,M);

for n=1:N
    for m=1:M
        e=zeros(1,12);
        for i=1:12  %1~12dim
            e(1,i)=(t(n,i)-r(m,i))^2;
        end
        d(n,m)=sum(e);           %�ڴX���o�Z��������(�i��t�Z��j)
    end
end


%=================�H�U��Viterbi search��initialzation=================:
D=zeros(size(d));  %�ֿn�Z���x�}D
D(1,1)=d(1,1);

for n=2:N
    D(n,1)=d(n,1)+D(n-1,1); %�o�����ֿn�ȥi�H(�ӦV�u���@��)�B��������(�ݷ|�����j�騺�Ψ�)
end

for m=2:M
    D(1,m)=d(1,m)+D(1,m-1); %�o�����ֿn�ȥi�H(�ӦV�u���@��)�B��������(�ݷ|�����j�騺�Ψ�)
end


%=================�H�U��Viterbi search��recursion,��X�U�Iminimum accumulate distance(�٥���e�Xoptimal path)=================:
for n=2:N  %�~�鴫��M,���鴫��N,�]�i
    for m=2:M
        D(n,m)=d(n,m)+min([D(n-1,m),D(n-1,m-1),D(n,m-1)]);  %�u�ਫ(0,+1),(+1,0),(+1,+1)
    end
end

%��Viterbi search��termination,�o��minimum total accumulate distance:
Endpoint_D=D(N,M);


%=================�H�U��Path Backtracking�A�ñN�̨θ��u�O���bw;�nback�Ӥ��q�Ytracking,�O�]���C�I�Ҧ��i�઺�e�@�B����"distance�ֿn��(D)"�i�Ѧ�,�ӱq�Ytrack�|�S��"����",�u��ݨ��̤p�Ȫ��U�@�B,���̫�o�쪺���|,�ֿn���Z���i�ण�O�Ҧ��i����|���̤p��.
n=N;    %test
m=M;    %ref
w=[];
w(1,:)=[N,M];

while ((n+m)~=2) %��=2,�N��F�Y
    if (n-1)==0 %n=1,��F���
        m=m-1;
    elseif (m-1)==0  %m=1,��F���
        n=n-1;
    else
        [~,column]=min([D(n-1,m),D(n,m-1),D(n-1,m-1)]);  %[�̤p��(�S�Ψ�i��~���N),�̤p�ȩҦb��]=...
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
    w=cat(1,w,[n,m]); %�N��쪺suboptimal path�O���U�ӡA�M���~���Y([1,1])��(by while);�i�g��w=[w;[n,m]];�i�H��w�e�X�̨θ��|
end