
function rb=RedBlack(u)
%%%%%%%%%%%%%%%%%%% divides the image into two regions named Black and Red


[m,n]=size(u);
rb=zeros(m,n,2);
for i=1:m
    for j=1:n
        
        if rem(i+j,2)==0 
            rb(i,j,1)=u(i,j); %%RED
        elseif rem(i+j,2)==1
            rb(i,j,2)=u(i,j);  %%BLACK
        end
       
    end
end
