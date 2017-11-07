function [H,amplitude] = moving_avg(u,v,siz)

H = zeros(length(u),length(v)); M = 1;N = 1;
coeff = (1/siz)^2;

low_ = -floor(siz/2);
high_ = ceil(siz/2);
for x = 1:length(u)
    for y = 1:length(v)
        H(x,y) = coeff*( (exp( -i*(v(y)/N)*low_ ) -exp( -i*(v(y)/N)*high_ ))/ (1 - exp(-i*(v(y)/N))) )* ...
            (( exp(-i*(u(x)/M)*low_) -exp(-i*(u(x)/M)*high_) )/ (1 - exp(-i*u(x)/M))) ;    
    end
end

amplitude = zeros(length(u),length(v));
for x = 1:length(u)
    for y = 1:length(v)
        amplitude(x,y) = sqrt( real(H(x,y))^2 + imag(H(x,y))^2 );
    end
end