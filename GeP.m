
function [A B] = GeP(A, B)
    n = length(B);
    for j = 1:n-1
          max=abs(A(j,j));
          l=j;
          for i = j+1:n
                if abs(A(i,j))>max
                      max = abs(A(i,j));
                      l=i;
                endif
          endfor
          if l != j 
                for t = j:n
                      a = A(l,t);
                      A(l,t)=A(j,t);
                      A(j,t)=a;
                endfor
                a=B(l);
                B(l)=B(j);
                B(j)=a; 
          endif
        for i = j+1:n
            mij = A(i,j) / A(j,j);
            A(i,j) = 0.0;
            A(i,j+1:n) -= mij * A(j,j+1:n);
            B(i) -= mij * B(j);
        end
    end
end