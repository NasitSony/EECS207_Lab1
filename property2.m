clear all;
M = 10;
N = 24;
a = 3;
b = 4;
f1 = rand(M,N);
f2 = rand(M,N);

for x=1:M
 for y=1:N
 f1_temp(x,y) = f1(x,y) * a;
 f2_temp(x,y) = f2(x,y) * b;
 end
end
LHS = myDFT2(f1_temp) + myDFT2(f2_temp);

F1_DFT = myDFT2( f1 );
F2_DFT = myDFT2( f2 );

RHS = a*F1_DFT + b*F2_DFT;

d = norm(LHS(:)-RHS(:));
fprintf(1,'difference between LHS and RHS is %e\n', d );

