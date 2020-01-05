

init=zeros(200,200); % Initial
    Co=0.001;
    Cs=100;
chark=100;  %wt % of C in charcoal
carb=0.001;  %initial carbon wt %
imagesc(init);
init(1:100,:)=carb;
init(101:200,:)=chark;
Cx=zeros(100);
% figure;
% image(init);
j=1;
for i=1:100
%     carb=carb+1; %diffusing 1 wt% C in each layer with increment
%     chark=chark-1;

    x=i/1000;
    D=4.3*10^(-11);
    t=36000;
    
    Cx= Cs- (Cs-Co)*erf(x/(2*((D*t)^0.5)));
    
    disp(Cx)
    carb=Cx;
    init(101-j,:)=carb;
    init(201-j,:)=chark;
    pause(0.1);
    image(init);
    j=j+1;
end
colorbar('Eastoutside')