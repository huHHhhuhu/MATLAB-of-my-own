function tab_trans_wordMLF(tabpath)

disp('#!MLF!#')
[~,~,~,d,~]=textread(tabpath,'%s%s%s%s%s','headerlines',1); %�N�C��r���Ʀs����cell array
% 'headerlines',1 :��Ū�Ĥ@line;
% %s :Read a white-space(�ťն��j) or delimiter-separated(�����j�w�q��) string

for i=1:10    % ����2~11line
    clear A B
    disp(['"*/' tabpath(41:46) num2str(i,'%05.2d') '.lab"'])  %'%05.2d' :�b�Ʀr�e���J0, �Q�i��Ʀr�e��5, ���2
    A=d{i,1}';  %{}:cell matrix, ��element�����H�N; A{1}��ܤ��M1��?�e�AA(1)��ܫ��w�����M; A=�r��,!=�Ʀr
    [m,~]=size(d{i,1}'); % m :phone�Ӽ�=�Ӧr��Ӽ�
    for j=1:m
        if A(j,1)=='0'  %Ū���r�ꤸ��A(j,1)
            B='ling';disp(B);
        elseif A(j,1)=='1'
            B='yi';disp(B);
        elseif A(j,1)=='2'
            B='er';disp(B);
        elseif A(j,1)=='3'
            B='san';disp(B);
        elseif A(j,1)=='4'
            B='si';disp(B);
        elseif A(j,1)=='5'
            B='wu';disp(B);
        elseif A(j,1)=='6'
            B='liu';disp(B);
        elseif A(j,1)=='7'
            B='qi'; disp(B);
        elseif A(j,1)=='8'
            B='ba';disp(B);
        elseif  A(j,1)=='9'
            B='jiu';disp(B);
        end
    end
    disp('.');
end
