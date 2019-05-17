function DFT2 = myDFT2(X)


temp = zeros(size(X));
DFT2_ARRAY = temp;

  nCol = size(X,2);
 

  for n = 1:nCol
    temp(:,n) = myDFT(X(:,n));
  end
  
  nRow=size(X,1); 
  for m = 1:nRow
    DFT2_ARRAY(m,:) = myDFT(temp(m,:).');
  end


DFT2 = DFT2_ARRAY;
end