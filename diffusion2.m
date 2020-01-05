D=4.3*10^(-11);
t=36000;

Cs=zeros(101);  %Surface concentration
Cx=zeros(101);  %Concentration at depth
Co=zeros(101);  %Bulk concentration
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
figure;
 imagesc(init);
j=1;k=100;
for i=1:100
    
    x(i)=i/1000; %distance in meter
    Cs(1)=chark;
    Co(1)=carb;
    
    %Fick's 2nd law of Carburization
    Cx(i)= Cs(i)- (Cs(i)-Co(i))*erf(x(i)/(2*((D*t)^0.5)));
    
    carb=Cx(i);
    init(101-j,:)=carb;
    init(201-k,:)=Cs(i);
    pause(0.1);
    image(init);
    j=j+1;k=k-1;
    Cs(i+1)=chark-Cx(i);
    Co(i+1)=Cx(i);
end
colorbar('Eastoutside')
% for i=1:100
%     plot(x(i),Cx(i));
%     hold on;
%     pause(0.1);
% end
    