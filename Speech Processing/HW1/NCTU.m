%--------------------------------------------------------------------------
clear all;

%aa
aaf1=[703.4 651.7 770.4];
aaf2=[1330.5 1186.6 1235.2];

%ae
aef1=[651.7 726.3 704.5];
aef2=[1838.2 1624.0 1309.6];

%ax
axf1=[614.5 613.4 612.5];
axf2=[1479.2 1615.3 1650.7];

%ah
ahf1=[553.7 579.3 586.1];
ahf2=[1404.0 1387.7 1371.5];

%ao
aof1=[547.0 541.9 539.4];
aof2=[1182.3 1187.3 1205.3];

%eh
ehf1=[688.0 680.8 689.6];
ehf2=[1577.9 1534.0 1591.8];

%ih
ihf1=[437.0 538.5 540.3];
ihf2=[2100.5 1679.4 1719.2];

%iy
iyf1=[479.7 424.2 535.8];
iyf2=[2107.9 1998.2 2031.9];

%uh
uhf1=[697.7 697.9 697.3];
uhf2=[1266.9 1259.9 1313.1];

%uw
uwf1=[409.7 410.9 409.6];
uwf2=[1107.2 1042.8 1044.2];


x=[aaf1 aef1 axf1 ahf1 aof1 ehf1 ihf1 iyf1 uhf1 uwf1 ];
y=[aaf2 aef2 axf2 ahf2 aof2 ehf2 ihf2 iyf2 uhf2 uwf2 ];
%x=[aaf1 aef1 axf1 ahf1 aof1 ehf1 ihf1 iyf1 uhf1 uwf1 ];
%y=[aaf2 aef2 axf2 ahf2 aof2 ehf2 ihf2 iyf2 uhf2 uwf2 ];

plot(y,x,'k.','LineWidth',1);
hold on;

x1=[631.7 704.5 862.4 633.9];
y1=[1303.4 1010.1 1410.1 1852.6];

plot(y1,x1,'k*','LineWidth',1);

axis([500,3000,200,1000]);
grid on;
title('Vowel graph(male)/.;[yao,wong,a,yue](male)/*');
xlabel('F2');
ylabel('F1');
set(gca,'XDir','reverse')
set(gca,'YDir','reverse')