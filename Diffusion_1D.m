% Simulating the 1-D Diffusion equation (Fourier's equation) by the
...Finite Difference Method(a time march)
    % Numerical scheme used is a first order upwind in time and a second order
...central difference in space (both Implicit and Explicit)
    %%
% carb = 0.83;
% sili = 0.35;
% mn = 0.9;
% sul = 0.007;
% phos = 0.02;

% d_cof = (10^-8)*[2 0.37 0.34 0.27 0.3];


%%
%Specifying Parameters
nx=101;               %Number of steps in space(x)
nt=100;               %Number of time steps
dt=0.01;              %Width of each time step
dx=2/(nx-1);         %Width of space step
x=0:dx:2;            %Range of x (0,2) and specifying the grid points
new=zeros(nx,1);
u=zeros(nx,1);       %Preallocating u
un=zeros(nx,1);      %Preallocating un
%Diffusion coefficient/viscosity
% vis=0.1;

% vis=3e-17;                %Fe in alpha-Fe BCC at 773K
% vis=1.8e-11;              %Fe in alpha-Fe BCC at 1173K
% vis=1.1e-13;              %Fe in gamma-Fe FCC at 1173K
% vis=7.8e-12;              %Fe in gamma-Fe FCC at 1373K
% vis=vis*10^11;

% vis=3.89e-9;            %N in FCC iron at 1273K
% vis=3.14e-8;            %N in BCC iron at 773K
% vis=vis*10^5;

% vis=4.2e-11;            %Ni in FCC iron at 1273K
% vis=vis*(10^8);

% vis=1.07e-4;            % H in FCC iron at 1273K
% vis=1.15e-4;            % H in BCC iron at 773K
% vis=vis*10^3;


% vis=2.4e-8;                 %C in alpha-Fe at 773K
vis=1.7e-6;                 %C in alpha-Fe at 1173K
% vis=5.9e-8;                 %C in gamma-Fe at 1173K
% vis=5.3e-7 ;                %C in gamma-Fe at 1373K
vis=vis*(10^3);

% vis=0.37e-8 ;               %Si
% vis=0.27e-8 ;               %S
% vis=0.3e-8 ;                %P
% vis=0.34e-8;                %Mn
% vis=vis*10^5;

beta=vis*dt/(dx*dx); %Stability criterion (0<=beta<=0.5, for explicit)
UL=1;                %Left Dirichlet B.C
UR=1;                %Right Dirichlet B.C
UnL=1;               %Left Neumann B.C (du/dn=UnL)
UnR=1;               %Right Neumann B.C (du/dn=UnR)
% figure;
% imagesc(u);
%%
%Initial Conditions: A square wave
% colormap('jet');
for i=1:nx
    if ((0.75<=x(i))&&(x(i)<=1.25))
        u(i)=0.83;
    else
        u(i)=0;
    end
    
end
% figure;
% plot(x,u);
% figure;
% imagesc(u);
% pause(2);
%%
%B.C vector
bc=zeros(nx-2,1);
bc(1)=vis*dt*UL/dx^2; bc(nx-2)=vis*dt*UR/dx^2;  %Dirichlet B.Cs
%bc(1)=-UnL*vis*dt/dx; bc(nx-2)=UnR*vis*dt/dx;  %Neumann B.Cs
%Calculating the coefficient matrix for the implicit scheme
E=sparse(2:nx-2,1:nx-3,1,nx-2,nx-2);
A=E+E'-2*speye(nx-2);        %Dirichlet B.Cs
%A(1,1)=-1; A(nx-2,nx-2)=-1; %Neumann B.Cs
D=speye(nx-2)-(vis*dt/dx^2)*A;

%%
%Calculating the velocity profile for each time step
figure;
pause(2);
colormap('jet');
i=2:nx-1;
for it=0:nt
    un=u;
        h=plot(x,u);       %plotting the velocity profile
    axis([0 2 0 3])
    title({['1-D Diffusion with \nu =',num2str(vis),' and \beta = ',num2str(beta)];['time(\itt) = ',num2str(dt*it)]})
    xlabel('Spatial co-ordinate (x) \rightarrow')
    ylabel('Transport property profile (u) \rightarrow')
        drawnow;
        refreshdata(h)
    %Uncomment as necessary
    %-------------------
    %Implicit solution
    
    U=un;U(1)=[];U(end)=[];
    U=U+bc;
    U=D\U;
    u=[UL;U;UR];                      %Dirichlet
    %u=[U(1)-UnL*dx;U;U(end)+UnR*dx]; %Neumann
    %}
    %-------------------
    %Explicit method with F.D in time and C.D in space
    %{
    u(i)=un(i)+(vis*dt*(un(i+1)-2*un(i)+un(i-1))/(dx*dx));
    %}
    
%     imagesc(u);
%     pause(0.1);
end

% figure;
% colormap('jet');
% imagesc(u);
% 
% figure;
% plot(x,u);