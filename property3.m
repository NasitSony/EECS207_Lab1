clear all;
M = 20;
N = 24;

u_0 = 10;
v_0 = 12;

f = rand(M,N);
for x=1:M
 for y=1:N
 f_temp(x,y) = f(x,y)*exp(1i*2*pi*((u_0*(x-1)/(M))+(v_0*(y-1)/(N))));
 end
end
LHS = myDFT2( f_temp );
% Compute right-hand-side of property which is DFT of f but CIRCULARLY
%shifted by (u_0, v_0).
F_DFT = myDFT2( f );
for u=1:M
    u_temp = u - u_0;
    u_temp = mod((u_temp-1), M) + 1;
    for v=1:N
      v_temp = v - v_0;
      v_temp = mod((v_temp-1), N) + 1;
      RHS(u, v) = F_DFT(u_temp, v_temp);
    end
end

% Compute sum-of-squared-difference.
d = norm(LHS(:)-RHS(:));
fprintf(1,'difference between LHS and RHS is %e\n', d );