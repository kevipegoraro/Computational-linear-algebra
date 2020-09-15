% The scalar equation of diffusion is very important and very studied, any problem involving 
% diffusion goes through it, so solving this equation as accurately as possible is very important. 
% It is in this contest that implicit methods enter and play a fundamental role in obtaining 
% consistent solutions in all points of the mesh.

% Below you can freely change the simulation data, or even modify 
% the method to solve any system of linear equations you want.

% Author: Kévi Pegoraro, 2020, e-mail: kevipegoraro@hotmail.com

function [Nt Nx x v t MMl MMr] = cn_initial(); 
%clear all; 
cond = 1/20; %Conductivity
L=1;
T=0.4;
Nt = 100;
Dt = T/Nt;
Nx = 100;
Dx = L/Nx;
b = cond*Dt/(Dx^2);
x = ones(1,Nx+1);
t = ones(1,Nt);
higth = 1e2;
for n = 1:Nx % The initial condition
    x(n) = (n-1)*Dx; % Definition of vector space
    v(n,1) =  higth*exp(-5*((x(n) - 0.5)/0.5).^2);
end
%keyboard
for j = 1:Nt+1
    v(1,j) = 0;
    v(Nx+1,j) = 0;
    t(j) = (j-1)*Dt; % Definition of vector time
end
%Defining the Matrices M_right and M_left in the method 
aal(1:n-2)=-b;
bbl(1:n-1)=2.+2.*b; 
ccl(1:n-2)=-b; 
MMl=diag(bbl,0)+diag(aal,-1)+diag(ccl,1); 
aar(1:n-2)=b;
bbr(1:n-1)=2.-2.*b;
ccr(1:n-2)=b; 
MMr=diag(bbr,0)+diag(aar,-1)+diag(ccr,1); 
endfunction

