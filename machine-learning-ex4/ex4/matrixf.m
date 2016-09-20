function [s y]= matrixf(m,n,)

s= zeros(m,n);
for i=1:m
    for j=1:n
        s(i,j) = j;
    end
end

y = ones(m,1);
for i=1:m
    y(i,1)=i;
end

for i=1:m
    z = (s(i,:)==y(i));
    s(i,:) = z;
end