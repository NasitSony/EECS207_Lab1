
s = 16;
mydft_times = zeros(s,1);
fft_times = zeros(s,1);

for i=1:s
 X = single(rand(2^i,1)) + 1i * single(rand(2^i,1));
 t = cputime;
 myDFT(X);
 mydft_times(i) = cputime - t;

 t = cputime;
 fft(X);
 fft_times(i) = cputime - t;
 fprintf(1, 'size=%d\tmydft: %f\tfft: %f\n', 2^i, mydft_times(i),fft_times(i) );
end


plot(2.^[1:s], mydft_times, 'bx-' );
hold;
plot(2.^[1:s], fft_times, 'ro--' );
plot(2.^[1:s],((2.^[1:s]).^2) * max(mydft_times) / ((2.^s).^2),'g*:')
legend('mydft','fft','M^2');
xlabel('M');
ylabel('cputime');



