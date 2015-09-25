clear all;
[x1,mn1,mx1]=melbankm(20,256,8000);% 利用8k取樣速率,20個filter bank
hold on;
for i=1:20
    plot([1:127]/127*8000/2,x1(i,:));%畫出 amplitude的圖形
end
xlim([1 4000])
xlabel('Frequency(Hz)');
ylabel('Frequency response magnitude');
title('sampling rate=8kHz, 20 filter banks');

[x2,mn2,mx2]=melbankm(24,512,16000);
figure;
hold on;
for i=1:24
    plot([1:255]/255*16000/2,x2(i,:));
end
xlabel('Frequency(Hz)');
ylabel('Frequency response magnitude');
title('sampling rate=16kHz, 24 filter banks');