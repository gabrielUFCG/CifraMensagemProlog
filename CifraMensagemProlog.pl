head([H|T], H).
tail([H|T], T).

retiraCaractere(L, [] , []).
retiraCaractere(L, [L|T], ['w'|G]):- retiraCaractere(L, T, G).
retiraCaractere(L, [H|T] , [H|G]):- retiraCaractere(L, T, G).

colocaX('',[H|T], [H]).
colocaX(H,[H|T], G) :- head(T,HT), colocaX(HT,T,S), N is ['x'|S] , G is [H|N].
colocaX(X,[H|T], G) :- head(T,HT), colocaX(HT,T,S), G is [H|S].

colocaX(N,[H|T], G) :-
:- initialization main.

main:-

	read_line_to_codes(user_input, M),
	string_to_atom(M,M2),
	string_chars(M2,Mensagem),
	retiraCaractere(' ',Mensagem,SemEspaco),
	tail(SemEspaco,AuxT),
	head(AuxT,AuxHT),
	colocaX(AuxHT,SemEspaco,ComX), 
	write(ComX).


