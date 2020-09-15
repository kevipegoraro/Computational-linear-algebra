
function [A B] = Ge(A, B)
    n = length(B);
    for j = 1:n-1
        for i = j+1:n
            if  A(i,j) != 0
            mij = A(i,j) / A(j,j);
            A(i,j) = 0.0;
            A(i,j+1:n) -= mij * A(j,j+1:n);
            B(i) -= mij * B(j);
            end
        end
    end
end
