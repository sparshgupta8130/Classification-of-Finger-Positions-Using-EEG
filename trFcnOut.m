function c = trFcnOut(x)

% c = 1./(1 + exp(-x));
  c = 2./(1 + exp(-2*x))-ones(size(x));
% c = x;
end