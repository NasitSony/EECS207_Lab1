clear all;

s = 5;
DFT_ARRAY = zeros(5,5);
delta_xy = zeros(5,5);
delta_xy(1,1)=1;
disp(delta_xy);

for k = 1: s
    for n = 1:s
        for m = 1:s
           DFT_ARRAY(k,n) = DFT_ARRAY(k,n) + delta_xy(m);
        end 
    end
end


DFT=DFT_ARRAY;
disp(DFT);
