
function FFT = myFFT(X)
n = size(X,1);
if n == 1
    FFT = X;
    return;
end
F = zeros(size(X));
% even index values
f_even = X(2:2:end) ;
% odd index values
f_odd = X(1:2:end) ;

F_even = myFFT(f_even);
F_odd = myFFT(f_odd);

n2 = round(n/2);

for i = 1:n2
    twiddle = exp(-1i*2*pi*i/n);
    oddTerm = F_odd(i)*twiddle;
    F(i) = F_even(i) +oddTerm;
    F(i + n2) = F_even(i) - oddTerm;  
end

FFT=F;
end
