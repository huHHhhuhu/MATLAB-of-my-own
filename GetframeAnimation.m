clear all;close all;
peaks;

disp('抓圖中...');

n=50;
for i=1:n
view(-37.5+(360/n)*i,30);
M(i)=getframe;
end

disp('畫面抓完了,按一下播放動畫');
pause
disp('播放中...');
movie(M,3) 