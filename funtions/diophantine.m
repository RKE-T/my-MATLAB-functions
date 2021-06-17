function [F, G] = diophantine(A, B, T)

% solve diophantine equation in form below:
% T = A x F + B x G;
% use as: [F, G]=diophantine(A, B, T);
% input polynomial coefficient in descending order.
% example: A = z^-1 + 2z^-2; 
% so A is [0, 1, 2];
%__________________________________________________
% TO HAVE THIS FUNCTION WORK, INCLUDE 'my_conv.m',
% SINCE FUNCKING MATLAB'S CONV BELOW DOES NOT 
% SUPPORT SYMBOLIC OPERATION.
%__________________________________________________
% 
%     function y = my_conv( x,h )
%         syms y_temp;
%         nx = length(x);
%         nh = length(h);
%         y = [y_temp zeros(1, nx+nh-2)];
%         y(1) = 0;
%         for index = 1:nx
%             indexSum = x(index)*h;
%             y(1, index : index+nh-1) = y(1, index:index+nh-1) + indexSum;
%         end
%     end

    order_of_A = length(A)-1;
    order_of_B = length(B)-1;
    order_of_F = order_of_B - 1;
    order_of_G = order_of_A - 1;
    T_extended = zeros(1, order_of_F + order_of_G + 2); % T=[x,x,x] --> T=[x,x,x,0,0,0...]
    T_extended(1:length(T)) = T;
        F = sym('f',[1 order_of_F+1]);
        G = sym('g',[1 order_of_G+1]);
        CON = my_conv(A, F) + my_conv(B, G);
    result = solve(CON == T_extended);
    F = zeros(1, order_of_F+1);
    G = zeros(1, order_of_G+1);
    for index = 1 : order_of_F+1
        eval(['F(' num2str(index) ')=result.f' num2str(index) ';']);
    end
    for index = 1 : order_of_G+1
        eval(['G(' num2str(index) ')=result.g' num2str(index) ';']);
    end

end
