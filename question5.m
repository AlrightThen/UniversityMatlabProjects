A=zeros(6,6)
for i = 1:6
    for j = 1:6
        if(mod(i,2)==0 && mod(j,2)==0)
            A(i,j) = i+j;
        elseif(mod(i,2)==0)
            A(i,j) = i*j;
        elseif(mod(j,2)==0)
            A(i,j) = 1;
        else
            A(i,j) = i-j;
        end
    end
end
A
Amax = A(1,1)
for i = 1:6
    for j = 1:6
        if(A(i,j)>Amax)
            Amax = A(i,j);
        end
    end
end
Amax
%A(:,3)
%A(:,6)
rowv = [A(:,3).',A(:,6).']
            