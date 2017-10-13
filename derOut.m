function c = derOut(x)
o = trFcnOut(x);
%  c = o.*(ones(size(o)) - o);
 c = (ones(size(o)) - o.*o);
% c = ones(size(o));
end