function p = findp(t)

load('Plutonium.mat');
t_value = find(tdata == t);

p = Pdata(t_value);

