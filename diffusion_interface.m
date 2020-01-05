

init=zeros(200,200); % Initial 

chark=100;  %wt % of C in charcoal Ca
carb=0.001;  %initial carbon wt %  Cb
imagesc(init);
init(1:100,:)=carb;  
init(101:200,:)=chark;

% figure;
% image(init);
j=1;
for i=1:100
%     carb=carb+1; %diffusing 1 wt% C in each layer with increment
%     chark=chark-1;
    init(101-j,:)=carb;
    init(201-j,:)=chark;
    pause(0.1);
    image(init);
    j=j+1;
end
colorbar('Eastoutside')