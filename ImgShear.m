function img_new = ImgShear(f,sv,sh)


Tv = [1 0 0; sv 1 0; 0 0 1];
Th = [1 sh 0; 0 1 0; 0 0 1];
Cx = size(f,1)/(size(f,1)+abs(sv*size(f,2)));
Cy = size(f,2)/(size(f,2)+abs(sh*size(f,1)));
Ts = [Cx 0 0; 0 Cy 0; 0 0 1];
T = Tv*Th*Ts;

trans_img = zeros(size(f));
for x = 1-size(trans_img,1)/2:size(trans_img,1)/2
    for y = 1-size(trans_img,2)/2:size(trans_img,2)/2
        temp = inv(T)*[x y 1]';
        if temp(1)>=1-size(f,1)/2 && temp(1)<=size(f,1)/2 && temp(2)>=1-size(f,2)/2 && temp(2)<=size(f,2)/2
            trans_img(x+size(trans_img,1)/2,y+size(trans_img,2)/2) = interp_bi(temp(1)+size(f,1)/2,temp(2)+size(f,2)/2,f);
        end
    end
end
%trans_img = trans_img(any(trans_img,2),:);
%trans_img = trans_img(:,any(trans_img,1));

img_new = mat2gray(trans_img);

end