a = 0;
for j = 1:0.5:5
    a = a + j;
end

for j = [1 2 3]
    a = a + j;
end


xr = -2.5;
xl = -4;

for j =1:100
    xc = (xl + xr)/2;
    fc = exp(xc) - tan(xc);
    if fc > 0
        xl = xc;
    else
        xr = xc;
    end
    if abs(fc) <10^(-5)
        break
    end
end





 