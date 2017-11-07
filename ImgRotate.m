function img_new = ImgRotate(varargin)

if nargin == 2
    f = varargin{1};
    theta = varargin{2};
    mode = 'corp';
elseif nargin == 3
    f = varargin{1};
    theta = varargin{2};
    mode = varargin{3};
end

T = [cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1];


if mode == 'corp'
    trans_img = zeros(size(f));
    for x = 1-size(trans_img,1)/2:size(trans_img,1)/2
        for y = 1-size(trans_img,2)/2:size(trans_img,2)/2
            temp = inv(T)*[x y 1]';
            if temp(1)>=1-size(f,1)/2 && temp(1)<=size(f,1)/2 && temp(2)>=1-size(f,2)/2 && temp(2)<=size(f,2)/2
                trans_img(x+size(f,1)/2,y+size(f,2)/2) = interp_bi(temp(1)+size(f,1)/2,temp(2)+size(f,2)/2,f);
            end
        end
    end
elseif mode == 'full'
    trans_img = zeros(1.5.*size(f));
    for x = 1-size(trans_img,1)/2:size(trans_img,1)/2
        for y = 1-size(trans_img,2)/2:size(trans_img,2)/2
            temp = inv(T)*[x y 1]';
            if temp(1)>=1-size(f,1)/2 && temp(1)<=size(f,1)/2 && temp(2)>=1-size(f,2)/2 && temp(2)<=size(f,2)/2
                trans_img(x+size(trans_img,1)/2,y+size(trans_img,2)/2) = interp_bi(temp(1)+size(f,1)/2,temp(2)+size(f,2)/2,f);
            end
        end
    end
    trans_img = trans_img(any(trans_img,2),:);
    trans_img = trans_img(:,any(trans_img,1));
end
img_new = mat2gray(trans_img);

end

