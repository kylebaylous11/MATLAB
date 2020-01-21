function pick=fn_menu
%fn_menu prints the menu of option
pick= menu('title','pick1','pick2','pick3');

%error checking
while pick==0
disp('Error!')
pick= menu('title','pick1','pick2','pick3');

end
end