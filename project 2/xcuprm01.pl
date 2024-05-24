% Zadani c. 37:
% Napiste program resici ukol dany predikatem u37(LIN,VIN), kde LIN je vstupni 
% celociselny seznam a VIN je vstupni promenna obsahujici libovolne prirozene 
% cislo. Predikat je pravdivy (ma hodnotu true), pokud pocet lichych cisel 
% v seznamu LIN neni vetsi nez cislo v promenne VIN, jinak je predikat 
% nepravdivy (ma hodnotu false).

% Testovaci predikaty:                       			 
u37_1:- u37([4,-3,7,8,3,7,0,-20],2).			% false
u37_2:- u37([4,-3,7,8,3,7,0,-20],5).			% true
u37_3:- u37([],2).					            % true
u37_r:- write('Zadej LIN: '),read(LIN),
	write('Zadej VIN: '),read(VIN),
	u37(LIN,VIN).

% Reseni:
u37(LIN,VIN):- 
    odd_numbers(LIN, Odd_cnt),    % Get the odd numbers count in LIN.
    Odd_cnt =< VIN.               % Evaluate the statement.

% Get the odd numbers count in LIN.
odd_numbers([], 0).               % An empty list.
odd_numbers([H|T], Odd_cnt):-     % List with odd head number.
    H mod 2 =:= 1,              
    odd_numbers(T, Odd_cnt_tmp),  % Recursive call.
    Odd_cnt is Odd_cnt_tmp + 1.   % Increment the odd numbers count.
odd_numbers([H|T], Odd_cnt):-     % List with even head number.
    H mod 2 =:= 0,
    odd_numbers(T, Odd_cnt).      % Recursive call.

% Author ~ Marek Čupr (xcuprm01)