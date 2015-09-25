%%
tic
x=1:0.1:50;
h=plot(x,sin(x).*exp(-x/5),'Erasemode','xor');
axis([-inf inf -1 1]);
for i=1:5000
    y=cos(x+i/50).^2.*exp(-x/5);
    set(h,'ydata',y);
    drawnow
end
toc
close

%% may be slower way:
x = 0:0.1:8*pi;
tic
for i = 1:5000
    plot(x, sin(x-i/50).*exp(-x/5));
    axis([-inf inf -1 1]);
    grid on
    drawnow
end
toc
close
