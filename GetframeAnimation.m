clear all;close all;
peaks;

disp('��Ϥ�...');

n=50;
for i=1:n
view(-37.5+(360/n)*i,30);
M(i)=getframe;
end

disp('�e���짹�F,���@�U����ʵe');
pause
disp('����...');
movie(M,3) 