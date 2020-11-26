function s=S(u,f,O)

%%%%% O is the inpainting domain

[m,n]=size(u);

for i=1:m
    for j=1:n
        
        if O(i,j)==1
            s(i,j)=u(i,j);
            
        elseif O(i,j)==0
            s(i,j)=(u(i,j)+0.1* f(i,j))/(1 + 0.1);
        end
        
    end
end

