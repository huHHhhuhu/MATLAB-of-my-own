%--------------------------------------------------------------------------
clear all;

%aa
aaf1=[821.2 728.9 774.6];
aaf2=[1335.3 1248.1 1327.0];

%ae
aef1=[743.1 731.2 723.7];
aef2=[1891.3 1874.9 1764.7];

%ax
axf1=[493.7 529.0 624.9];
axf2=[1421.9 1299.2 1271.4];

%ah
ahf1=[763.4 820.5 832.9];
ahf2=[1624 1097.5 1510.1];

%ao
aof1=[701.9 671.2 640.5];
aof2=[1163 1163 1132];

%eh
ehf1=[794.1 646.0 751.2 ];
ehf2=[1993 1901.6 2031.1];

%ih
ihf1=[517.6 504.6 650.1];
ihf2=[2023 2200.2 1916.8];

%iy
iyf1=[428.6 448.5 460.2];
iyf2=[2406.3 2482.0 2423.2];

%uh
uhf1=[674.1 491.0 685.7];
uhf2=[1586.9 1708.9 1588.1];

%uw
uwf1=[468.2 494.2 451.6 ];
uwf2=[1048.0 1051.4 1052.8];


x=[aaf1 aef1 axf1 ahf1 aof1 ehf1 ihf1 iyf1 uhf1 uwf1 ];
y=[aaf2 aef2 axf2 ahf2 aof2 ehf2 ihf2 iyf2 uhf2 uwf2 ];
%x=[aaf1 aef1 axf1 ahf1 aof1 ehf1 ihf1 iyf1 uhf1 uwf1 ];
%y=[aaf2 aef2 axf2 ahf2 aof2 ehf2 ihf2 iyf2 uhf2 uwf2 ];

plot(y,x,'k.','LineWidth',1);
axis([500,3000,200,1000]);
grid on;
title('Vowel graph(female)');
xlabel('F2');
ylabel('F1');
set(gca,'XDir','reverse')
set(gca,'YDir','reverse')