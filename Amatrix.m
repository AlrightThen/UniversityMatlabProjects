function A = Amatrix(N,M)
A = zeros(N,M);
for i = 1:N
    for j = 1:M
        if(i==j)
            A(i,j)=i*j;
        elseif(i-j==1)
            A(i,j)=2*i-3*j;
        elseif(j-i==1)
            A(i,j)=i+4*j;
        elseif(abs(i-j)==2)
            A(i,j)=1;
        else
            A(i,j)=0;
        end
    end
end