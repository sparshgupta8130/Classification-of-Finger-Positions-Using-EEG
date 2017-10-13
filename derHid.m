function c = derHid(x)
o = trFcnHid(x);
%  c = o.*(ones(size(o)) - o);
 c = (ones(size(o)) - o.*o);
end