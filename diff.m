D=4.3*10^(-11);
    t=36000;
Cs=zeros(101);
Cx=zeros(101);
Co=zeros(101);

Ck=zeros(101);
init=zeros(200,200); % Initial
    Co(1)=0.001;
    Cs(1)=100;
chark=100;  %wt % of C in charcoal
carb=0.001;  %initial carbon wt %
imagesc(init);
init(1:100,:)=carb;
init(101:200,:)=chark;
% Cx=zeros(100);
% figure;
% image(init);
j=1;k=100;
for i=1:100
%     carb=carb+1; %diffusing 1 wt% C in each layer with increment
%     chark=chark-1;

    x=i/1000;
    Cs(1)=chark;
    Co(1)=carb;
    Cx(i)= Cs(i)- (Cs(i)-Co(i))*erf(x/(2*((D*t)^0.5)));
    
    disp(Cx(i))
    carb=Cx(i);
    init(101-j,:)=carb;
    init(201-k,:)=Cs(i)-Cx(i);
    pause(0.1);
    image(init);
    j=j+1;k=k-1;
    Cs(i+1)=Cs(i)-Cx(i);
    Co(i+1)=Cx(i);
%     chark=Cs;
end
colorbar('Eastoutside')