function mainfunc()
A11=input('input A(1,1): ')
A12=input('input A(1,2): ')
A21=input('input A(2,1): ')
A22=input('input A(2,2): ')
A = [A11 A12; A21 A22]
b11=input('input B(1,1): ')
b21=input('input B(2,1): ')
b = [b11; b21]
MathSolve(A,b)
end
function [x] = MathSolve(A,b)
detA = A(1,1)*A(2,2)-(A(1,2)*A(2,1))
if(detA == 0)
    fprintf('Will not proceed. Determinant of A is 0!\n');
else
    invA = [A(2,2) -A(1,2); -A(2,1) A(1,1)]/detA
    x = invA*b
end
end