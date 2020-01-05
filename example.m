Co=0.001;
Cs=100;

D=4.3*10^(-11);
t=36000;
for x=0.001:0.001:0.1
Cx= Cs- (Cs-Co)*erf(x/(2*(sqrt(D*t))));
disp(Cx)
plot(x,Cx,'*')
hold on;
pause(0.1);
end