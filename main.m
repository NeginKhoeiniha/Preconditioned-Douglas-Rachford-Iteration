clear
clc

%%%%%%%%%%%%%%%%%%% The image to be inpainted and the loss region

u0=('C:\Users\EZ-Tech\Desktop\PDR\u0.png');
u0=imread(u0); u0=rgb2gray(u0); u0=im2double(u0);

O=('C:\Users\EZ-Tech\Desktop\PDR\lossregion.png'); 
O=imread(O); O=rgb2gray(O); O=im2double(O);

%%%%%%%%%%%%%%%%%%% Parameters

numer_iter=1000;
k=1; % inner iteration for symmetric Gauss-Seidel (SRGBS)
sigma=0; % step size
t=0.1; % gradient scaling
lambda=1;  % in SRGBS 
mu=t;
%%%%%%%%%%%%%%%%%%% initial guess

u=u0;
u_bar=u0;
[n,m]=size(u0);
p=zeros(n,m,2);

%%%%%%%%%%%%%%%%%%% Algorithm
for i=1:numer_iter
    
    [p1x,p1y]=DxDy_minus(p(:,:,1));   % backward differences
    [p2x,p2y]=DxDy_minus(p(:,:,2));
    div_p= p1x + p2y;
    
    [u_x , u_y]=DxDy_plus(u);         % forward differences
    
    u=SRBGS(u, u_bar + (sigma * t) * div_p, lambda, mu, k);   %SRGBS function to uptade the image
    
    pp(:,:,1)=p(:,:,1) + (sigma * t * u_x) ;pp(:,:,2)=p(:,:,2) + (sigma * t * u_y);
    
    u_bar=u_bar + S((2* u) - u_bar ,u0 , O) - u;
    
    p=p + P(2*pp - p) - pp;
    
     imshow(u)

end
imshow(u)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%% gradient of u with forward differences
function [dx,dy]=DxDy_plus(u)

Dx=[0 0 0;0 -1 1;0 0 0];
Dy=[0 1 0;0 -1 0;0 0 0];
dx=imfilter(u,Dx,'conv');
dy=imfilter(u,Dy,'conv');


end

%%%%%%%%%%%%%%%%%%% gradient of u with backward differences
function [dx,dy]=DxDy_minus(u)

Dx=[0 0 0;-1 1 0;0 0 0];
Dy=[0 -1 0;0 1 0;0 0 0];
dx=imfilter(u,Dx,'conv');
dy=imfilter(u,Dy,'conv');

end

