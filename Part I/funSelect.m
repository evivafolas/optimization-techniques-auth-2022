function funct = funSelect(x,funNo)
    if funNo == 1
        funct = (x-3)^2+(sin(x+3))^2;
        
%         fplot(@(x) ((x-3)^2+(sin(x+3))^2), [-4,4]);
%         grid on
%         title('f1(x) = (x-3)^2+(sin(x+3))^2 , [-4,4]')
%         xlabel('x');
%         ylabel('y');

    elseif funNo == 2
        funct = (x-1)*cos(x/2)+x^2; 
        
%         fplot(@(x) ((x-1)*cos(x/2)+x^2), [-4,4])
%         grid on
%         title('f2(x) = (x-1)*cos(x/2)+x^2 , [-4,4]')
%         xlabel('x');
%         ylabel('y');
        
    elseif funNo == 3
        funct = (x+2)^2 + exp(x-2)*sin(x+3);
        
%         fplot(@(x) ((x+2)^2 + exp(x-2)*sin(x+3)), [-4,4])
%         grid on
%         title('f3(x) = (x+2)^2 + exp(x-2)*sin(x+3) , [-4,4]')
%         xlabel('x');
%         ylabel('y');
    end
end
