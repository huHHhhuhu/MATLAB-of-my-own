function tab_trans_wordMLF(tabpath)

disp('#!MLF!#')
[~,~,~,d,~]=textread(tabpath,'%s%s%s%s%s','headerlines',1); %將每行字串資料存取成cell array
% 'headerlines',1 :不讀第一line;
% %s :Read a white-space(空白間隔) or delimiter-separated(有分隔定義符) string

for i=1:10    % 原資料2~11line
    clear A B
    disp(['"*/' tabpath(41:46) num2str(i,'%05.2d') '.lab"'])  %'%05.2d' :在數字前插入0, 十進位數字寬度5, 精度2
    A=d{i,1}';  %{}:cell matrix, 其element類型隨意; A{1}表示元胞1的?容，A(1)表示指定的元胞; A=字串,!=數字
    [m,~]=size(d{i,1}'); % m :phone個數=該字串個數
    for j=1:m
        if A(j,1)=='0'  %讀取字串元素A(j,1)
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
