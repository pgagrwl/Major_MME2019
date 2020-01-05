clear all; clf;
L=100;H=200;
u=zeros(L,H);
iteration=0;
u(1,:)=1;
u(L,:)=1;
u(:,1)=1;
u(:,H)=1;
while (iteration<200)
    iteration=iteration+1;
    if(mod(iteration,10)==0)
        imagesc(u);
        colorbar;
        drawnow;
    end
    Lu=del2(u);
    u(2:L-1,2:H-1)= u(2:L-1,2:H-1) + Lu(2:L-1,2:H-1);
end