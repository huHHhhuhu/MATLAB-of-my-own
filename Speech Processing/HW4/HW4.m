%���{���X�ݦۦ�@�q�q�̻ݨD���ϥ�
%=============��mfcc�ɸ��=============:                                                     
mid1=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\��\��-��q�j��.mfcc');                                                   
mid2=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\��\��-��q�j��.mfcc');                                                   
mid3=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\��\��-�H���B�z.mfcc');                                                   
mid4=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\��\��-�y���H��.mfcc');                                                   
mid5=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\��\��-�y���B�z.mfcc');                                                   
mid6=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\��\��-��q�j���g.mfcc');                                                 
mid7=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\��\��-��q�j����.mfcc');  
                                               
fast1=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\��\��-��q�j��.mfcc');                                                  
fast2=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\��\��-��q�j��.mfcc');                                                  
fast3=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\��\��-�H���B�z.mfcc');                                                  
fast4=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\��\��-�y���H��.mfcc');                                                  
fast5=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\��\��-�y���B�z.mfcc');                                                  

slow1=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\�C\�C-��q�j��.mfcc');                                                  
slow2=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\�C\�C-��q�j��.mfcc');                                                  
slow3=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\�C\�C-�H���B�z.mfcc');                                                  
slow4=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\�C\�C-�y���H��.mfcc');                                                  
slow5=readhtk('D:\NCTU\�ҵ{\�y���B�z\HW4\HOMEWORK4\�C\�C-�y���B�z.mfcc');

%��DTW(3�ب��k):
Endpoint_D=zeros(50,1);
[Endpoint_D(1),D,w]=DTW(slow1,mid1); 
[Endpoint_D(2),D,w]=DTW(slow2,mid1); 
[Endpoint_D(3),D,w]=DTW(slow3,mid1); 
[Endpoint_D(4),D,w]=DTW(slow4,mid1); 
[Endpoint_D(5),D,w]=DTW(slow5,mid1); 
[Endpoint_D(6),D,w]=DTW(fast1,mid1); 
[Endpoint_D(7),D,w]=DTW(fast2,mid1); 
[Endpoint_D(8),D,w]=DTW(fast3,mid1); 
[Endpoint_D(9),D,w]=DTW(fast4,mid1); 
[Endpoint_D(10),D,w]=DTW(fast5,mid1); 

[Endpoint_D(11),D,w]=DTW(slow1,mid2); 
[Endpoint_D(12),D,w]=DTW(slow2,mid2); 
[Endpoint_D(13),D,w]=DTW(slow3,mid2); 
[Endpoint_D(14),D,w]=DTW(slow4,mid2); 
[Endpoint_D(15),D,w]=DTW(slow5,mid2); 
[Endpoint_D(16),D,w]=DTW(fast1,mid2); 
[Endpoint_D(17),D,w]=DTW(fast2,mid2); 
[Endpoint_D(18),D,w]=DTW(fast3,mid2); 
[Endpoint_D(19),D,w]=DTW(fast4,mid2); 
[Endpoint_D(20),D,w]=DTW(fast5,mid2); 

[Endpoint_D(21),D,w]=DTW(slow1,mid3); 
[Endpoint_D(22),D,w]=DTW(slow2,mid3); 
[Endpoint_D(23),D,w]=DTW(slow3,mid3); 
[Endpoint_D(24),D,w]=DTW(slow4,mid3); 
[Endpoint_D(25),D,w]=DTW(slow5,mid3); 
[Endpoint_D(26),D,w]=DTW(fast1,mid3); 
[Endpoint_D(27),D,w]=DTW(fast2,mid3); 
[Endpoint_D(28),D,w]=DTW(fast3,mid3); 
[Endpoint_D(29),D,w]=DTW(fast4,mid3); 
[Endpoint_D(30),D,w]=DTW(fast5,mid3); 

[Endpoint_D(31),D,w]=DTW(slow1,mid4); 
[Endpoint_D(32),D,w]=DTW(slow2,mid4); 
[Endpoint_D(33),D,w]=DTW(slow3,mid4); 
[Endpoint_D(34),D,w]=DTW(slow4,mid4); 
[Endpoint_D(35),D,w]=DTW(slow5,mid4); 
[Endpoint_D(36),D,w]=DTW(fast1,mid4); 
[Endpoint_D(37),D,w]=DTW(fast2,mid4); 
[Endpoint_D(38),D,w]=DTW(fast3,mid4); 
[Endpoint_D(39),D,w]=DTW(fast4,mid4); 
[Endpoint_D(40),D,w]=DTW(fast5,mid4); 

[Endpoint_D(41),D,w]=DTW(slow1,mid5); 
[Endpoint_D(42),D,w]=DTW(slow2,mid5); 
[Endpoint_D(43),D,w]=DTW(slow3,mid5); 
[Endpoint_D(44),D,w]=DTW(slow4,mid5); 
[Endpoint_D(45),D,w]=DTW(slow5,mid5); 
[Endpoint_D(46),D,w]=DTW(fast1,mid5); 
[Endpoint_D(47),D,w]=DTW(fast2,mid5); 
[Endpoint_D(48),D,w]=DTW(fast3,mid5); 
[Endpoint_D(49),D,w]=DTW(fast4,mid5); 
[Endpoint_D(50),D,w]=DTW(fast5,mid5); 

%=============�e�̨θ��|=============:
%�ۤv�@�ӭӧ�Ѽ�
figure('visible','off');
h=plot(w(:,1),w(:,2));
title('test/��-��q�j����,ref/��-��q�j��') %
xlabel('test template(frames)');
ylabel('reference template(frames)');
saveas(h,'mid7,mid1_3','bmp');  %

% size(w);    %�̨θ��|�����B��
% size(mid1);
% size(fast1)

%=============�̲ײֿn�Z��=============:
save Endpoint_D3.txt Endpoint_D -ascii %�N�Ҧ��̲ײֿn�Z���s��txt
%��������A��X�Z���̤p��:
winner=[];
for i=0:9
[minimum_Dis, position]=min(Endpoint_D(1+5*i:5*(i+1)));
winner=[winner;minimum_Dis,position];
end
winner

%�t�@���|�[�g�k:
% minimum_Dis=zeros(6,1);
% position=zeros(6,1);
% for i=0:5
% [minimum_Dis(i+1), position(i+1)]=min(Dis_all(1+5*i:5*(i+1)))
% end
% [minimum_Dis position]

%=============�t�@��step forward constrait(5�ب��k)=============:
%��DTW_2:
Endpoint_D=zeros(50,1);
[Endpoint_D(1),D,w]=DTW_2(slow1,mid1); 
[Endpoint_D(2),D,w]=DTW_2(slow2,mid1); 
[Endpoint_D(3),D,w]=DTW_2(slow3,mid1); 
[Endpoint_D(4),D,w]=DTW_2(slow4,mid1); 
[Endpoint_D(5),D,w]=DTW_2(slow5,mid1); 
[Endpoint_D(6),D,w]=DTW_2(fast1,mid1); 
[Endpoint_D(7),D,w]=DTW_2(fast2,mid1); 
[Endpoint_D(8),D,w]=DTW_2(fast3,mid1); 
[Endpoint_D(9),D,w]=DTW_2(fast4,mid1); 
[Endpoint_D(10),D,w]=DTW_2(fast5,mid1); 

[Endpoint_D(11),D,w]=DTW_2(slow1,mid2); 
[Endpoint_D(12),D,w]=DTW_2(slow2,mid2); 
[Endpoint_D(13),D,w]=DTW_2(slow3,mid2); 
[Endpoint_D(14),D,w]=DTW_2(slow4,mid2); 
[Endpoint_D(15),D,w]=DTW_2(slow5,mid2); 
[Endpoint_D(16),D,w]=DTW_2(fast1,mid2); 
[Endpoint_D(17),D,w]=DTW_2(fast2,mid2); 
[Endpoint_D(18),D,w]=DTW_2(fast3,mid2); 
[Endpoint_D(19),D,w]=DTW_2(fast4,mid2); 
[Endpoint_D(20),D,w]=DTW_2(fast5,mid2); 

[Endpoint_D(21),D,w]=DTW_2(slow1,mid3); 
[Endpoint_D(22),D,w]=DTW_2(slow2,mid3); 
[Endpoint_D(23),D,w]=DTW_2(slow3,mid3); 
[Endpoint_D(24),D,w]=DTW_2(slow4,mid3); 
[Endpoint_D(25),D,w]=DTW_2(slow5,mid3); 
[Endpoint_D(26),D,w]=DTW_2(fast1,mid3); 
[Endpoint_D(27),D,w]=DTW_2(fast2,mid3); 
[Endpoint_D(28),D,w]=DTW_2(fast3,mid3); 
[Endpoint_D(29),D,w]=DTW_2(fast4,mid3); 
[Endpoint_D(30),D,w]=DTW_2(fast5,mid3); 

[Endpoint_D(31),D,w]=DTW_2(slow1,mid4); 
[Endpoint_D(32),D,w]=DTW_2(slow2,mid4); 
[Endpoint_D(33),D,w]=DTW_2(slow3,mid4); 
[Endpoint_D(34),D,w]=DTW_2(slow4,mid4); 
[Endpoint_D(35),D,w]=DTW_2(slow5,mid4); 
[Endpoint_D(36),D,w]=DTW_2(fast1,mid4); 
[Endpoint_D(37),D,w]=DTW_2(fast2,mid4); 
[Endpoint_D(38),D,w]=DTW_2(fast3,mid4); 
[Endpoint_D(39),D,w]=DTW_2(fast4,mid4); 
[Endpoint_D(40),D,w]=DTW_2(fast5,mid4); 

[Endpoint_D(41),D,w]=DTW_2(slow1,mid5); 
[Endpoint_D(42),D,w]=DTW_2(slow2,mid5); 
[Endpoint_D(43),D,w]=DTW_2(slow3,mid5); 
[Endpoint_D(44),D,w]=DTW_2(slow4,mid5); 
[Endpoint_D(45),D,w]=DTW_2(slow5,mid5); 
[Endpoint_D(46),D,w]=DTW_2(fast1,mid5); 
[Endpoint_D(47),D,w]=DTW_2(fast2,mid5); 
[Endpoint_D(48),D,w]=DTW_2(fast3,mid5); 
[Endpoint_D(49),D,w]=DTW_2(fast4,mid5); 
[Endpoint_D(50),D,w]=DTW_2(fast5,mid5); 


%=============�h������y�H�t�@��Endpoint constrait(0.7~1)+5�ب��k=============:
%��DTW_3:
Endpoint_D=zeros(10,1);
[Endpoint_D(1),D,w]=DTW_3(mid6,mid1); 
[Endpoint_D(2),D,w]=DTW_3(mid7,mid1); 
[Endpoint_D(3),D,w]=DTW_3(mid6,mid2); 
[Endpoint_D(4),D,w]=DTW_3(mid7,mid2); 
[Endpoint_D(5),D,w]=DTW_3(mid6,mid3); 
[Endpoint_D(6),D,w]=DTW_3(mid7,mid3); 
[Endpoint_D(7),D,w]=DTW_3(mid6,mid4); 
[Endpoint_D(8),D,w]=DTW_3(mid7,mid4); 
[Endpoint_D(9),D,w]=DTW_3(mid6,mid5); 
[Endpoint_D(10),D,w]=DTW_3(mid7,mid5); 


