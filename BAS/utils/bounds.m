function x = bounds(x,upper,lower)
    size_x = size(x);
    n = size_x(1);
    
    size_lower = size(lower); %for BSO
    if size_lower(2) == 1
        tmp_upper = repmat(upper,n,size_x(2));
        tmp_lower = repmat(lower,n,size_x(2));
    else
        tmp_upper = repmat(upper,n,1); %for BSAS/BAS
        tmp_lower = repmat(lower,n,1);
    end
    upper_flag = x > tmp_upper;
    if ismember(1,upper_flag)
        x(upper_flag) = tmp_upper(upper_flag);
    end
    
    lower_flag = x < tmp_lower;
    if ismember(1,lower_flag)
        x(lower_flag) = tmp_lower(lower_flag);
    end
end

%test
% dir = directions(3,2)
% x = zeros(3,2)
% d = 2
% [xleft,xright] = antenna(x,dir,d)
% upper = [1,0.5]
% lower = [0.5,-0.5]
% bounds(xleft,upper,lower)