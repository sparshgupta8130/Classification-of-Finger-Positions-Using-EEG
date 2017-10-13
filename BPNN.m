%%Function for inmplementing Back Propagation algorithm (BPNN)
%Created By: RC19
%Date: 04 - 02 - 2016

function [v w] = BPNN(in,tg,epoch,eta)

% Initializations
[rin,cin] = size(in);     % rin is the no. of features, cin is the no. of instances
[rout,cout] = size(tg);   % rout is the no. of output neurons, cout is the no. of instances
N = 50;                    % No. of neurons in hidden layer
% eta = 0.3;                  % learning rate
v = rand(rin,N);          % Weight matrix from Input to Hidden v(i,j) = wt of ith input to jth hidden neuron
w = rand(N,rout);         % Weight matrix from Hidden to Output w(i,j) = wt of ith input to jth output neuron
Error = zeros(epoch,1);

for k = 1:epoch
    
    for i = 1:cin
        neth = v'*in(:,i);             % net of hidden layer neth(i) = net of ith hidden neuron
        outh = trFcnHid(neth);

        neto = w'*outh;                % net of output layer neto(i) = net of ith output neuron 
        outo = trFcnOut(neto);

        delOut = (tg(:,i)-outo).*derOut(outo);        
        delW = eta*delOut*outh';

        delHid = (w*delOut).*derHid(outh);
        delV = eta*delHid*in(:,i)';

        w = w+delW';
        v = v+delV';
    end
    
    % Error plot
    for i = 1:cin
        nethe = v'*in(:,i);             % net of hidden layer neth(i) = net of ith hidden neuron
        outhe = trFcnHid(nethe);

        netoe = w'*outhe;                % net of output layer neto(i) = net of ith output neuron 
        outoe = trFcnOut(netoe);
        Oute(:,i) = outoe;
    end
    err = (Oute-tg).^2;
    Error(k) = 0.5*sum(err(:));

end
% min(Error)
plot(Error);
pause;