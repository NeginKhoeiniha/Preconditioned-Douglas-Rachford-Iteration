function S=SRBGS(u,b,lambda,mu,k)

 % k : inner iteration for symmetric Gauss-Seidel
 
[n,m]=size(u);

R=RedBlack(u);
uur=u;
u_red=R(:,:,1);
u_black=R(:,:,2);

ub=R(:,:,2);


 for v=0:k-1   %inner iteration for symmetric Gauss-Seidel
     
    for i=2:n-1   % (u_red)^ k+(v+1/2)/n
        for j=2:m-1    
            N_ij=[i+1,i-1,j+1,j-1];
            c_ij=length(find(N_ij>0));
             
            if rem(i+j,2)==0
            
            uur(i,j)=(1/(lambda + c_ij * mu))*(b(i,j)+ (mu * (ub(i,j+1) +...
                ub(i,j-1) + ub(i+1,j) + ub(i-1,j))));

            end
        end
    end
    
     for i=2:n-2    % (u_black)^ k+(v+1)/n
        for j=2:m-2    
            N_ij=[i+1,i-1,j+1,j-1];
            c_ij=length(find(N_ij>0));
            
            if rem(i+j,2)==1
                
            u_black(i,j)=(1/(lambda + c_ij * mu))*(b(i,j)+ mu * (uur(i,j+1) +...
                uur(i,j-1) + uur(i+1,j) + uur(i-1,j)));
            
            end
        end
      end
 end 

     for i=2:n-3    % (u_red)^ k+1
        for j=2:m-3
            N_ij=[i+1,i-1,j+1,j-1];
            c_ij=length(find(N_ij>0));
            
            if rem(i+j,2)==0
            
            u_red(i,j)=(1/(lambda + c_ij * mu))*(b(i,j)+ mu * (u_black(i,j+1) +...
                u_black(i,j-1) + u_black(i+1,j) + u_black(i-1,j)));
            
            end
        end
    end
    
    
 S=u_red+u_black;