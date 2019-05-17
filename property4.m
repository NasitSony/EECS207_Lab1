clear all;
M = 10;
N = 24;
f = rand(M,N);
% Demonstrate translation-to-center-of-frequency property.
% Compute LHS which is DFT of f multiplied by (-1)^(x+y).
for x=1:M
 for y=1:N
 f_temp(x,y) = f(x,y) * ((-1)^((x-1)+(y-1)));
 end
end
LHS = myDFT2( f_temp );
% Compute right-hand-side of property which is DFT of f but CIRCULARLY
%shifted by (M/2,N/2).
F_DFT = myDFT2( f );
for u=1:M
 u_temp = u - (M/2);
 u_temp = mod((u_temp-1), M) + 1;
 for v=1:N
 v_temp = v - (N/2);
 v_temp = mod((v_temp-1), N) + 1;
 RHS(u, v) = F_DFT(u_temp, v_temp);
 end
end
% Compute sum-of-squared-difference.
d = norm(LHS(:)-RHS(:));
fprintf(1,'difference between LHS and RHS is %e\n', d );