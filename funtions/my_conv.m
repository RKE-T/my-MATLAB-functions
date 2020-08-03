function y = my_conv( x,h )
% my_conv is the sanme function as conv();
% But supports symbolic operations.
% _________________________________________
% |WHY DOSE'T MATLAB JUST GIVE ME THIS !?  |
% |FUCK MATLAB !                           |
% |________________________________________|
    syms y_temp;
    nx = length(x);
    nh = length(h);
    y = [y_temp zeros(1, nx+nh-2)];
    y(1) = 0;
    for index = 1:nx
        indexSum = x(index)*h;
        y(1, index : index+nh-1) = y(1, index:index+nh-1) + indexSum;
    end

end