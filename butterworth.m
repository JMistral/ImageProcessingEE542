function [H,H_inv] = butterworth(D0,n,siz)

H = zeros(siz,siz);
%A = floor(siz/2);
H_detail = zeros(200,200);

%we need to 
for u = -siz:siz
    for v = -siz:siz
        D =  (u^2) + (v^2);
        denom = 1 + (D/D0)^(2*n);
        H(u+siz+1,v+siz+1) = 1/denom;
    end
end

%use ifft2 to transform the padded kernel back to spatial domain with size
%(siz*siz)
H_inv = abs(ifft2(H,siz,siz));
coeff = sum(H_inv(:));
H_inv = H_inv./coeff;


% U = -A:A/100:A;
% V = -A:A/100:A;
% for u = 1:length(U)
%     for v = 1:length(V)
%         D =  (U(u)^2) + (V(v)^2);
%         denom = 1 + (D/D0)^(2*n);
%         H_detail(u,v) = 1/denom;
%     end
% end