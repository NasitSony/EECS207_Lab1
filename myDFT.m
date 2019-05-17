function DFT = myDFT(X)
s = size(X,1);

DFT_ARRAY = zeros(size(X));
%disp(DFT_ARRAY)
for n = 1:s
    for m = 1:s
     DFT_ARRAY(n) = DFT_ARRAY(n) + exp(-1i*2*pi*(n-1)*(m-1)/s) * X(m);
    end 
end
DFT=DFT_ARRAY;
end
