s = 16;
myfft_times = zeros(s,1);
fft_times = zeros(s,1);

for i=1:s
 X = single(rand( 2^i,1)) + 1i * single(rand( 2^i,1));
 %disp(X);
 t = cputime;
 myFFT(X);
 myfft_times(i) = cputime - t;

 t = cputime;
 fft(X);
 fft_times(i) = cputime - t;
 fprintf(1, 'size=%d\tmyFFT: %f\tfft: %f\n', 2^i, myfft_times(i),fft_times(i) );
end


plot(2.^[1:s], myfft_times, 'bx-' );
hold;
plot(2.^[1:s], fft_times, 'ro--' );
plot(2.^[1:s],((2.^[1:s]).^2) * max(myfft_times) / ((2.^s).^2),'g*:')
legend('myfft','fft','MlogM');
xlabel('M');
ylabel('cputime');
