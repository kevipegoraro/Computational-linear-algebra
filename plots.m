% Author: Kévi Pegoraro, 2020, e-mail: kevipegoraro@hotmail.com

function plots(Nt, totalsum, v, x, t, T, total)
% Graphical representation of the computational cust      
figure(6); 
ve=2:Nt; tt=t(ve); totalm=(totalsum/Nt)*ones(Nt-1,1);
plot(tt,total(ve),'p',tt,totalm,'--')
xlabel('t'); ylabel('time'); 
title('GPU time');
legend ('total','media')

%Graphical representation of the temperature at different selected times 

figure(3)
plot(x,v(:,round(Nt/5)),'-',x,v(:,round(2*Nt/5)),'-',x,v(:,round(3*Nt/5)),'-',x,v(:,round(4*Nt/5)),'-');
title(T);
xlabel('X'); ylabel('Temperature');

figure(4)
mesh(x,t,v');
title(T); 
xlabel('X'); ylabel('Time'); zlabel('Temperature');
endfunction
