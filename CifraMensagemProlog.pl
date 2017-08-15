head([H|T], H).

tail([H|T], T).

insere(X, L, [X|L]).

insereFim(T, [H], L):- insere(H, [T], L). 
insereFim(N, [H|T], L):- insereFim(N, T, X), insere(H, X, L).


colocaFlagEspaco(L, [] , []).
colocaFlagEspaco(L, [L|T], ['w'|G]):- colocaFlagEspaco(L, T, G).
colocaFlagEspaco(L, [H|T] , [H|G]):- colocaFlagEspaco(L, T, G).

colocaX(L, [], [L]).
colocaX(L, [L|T], [L|['x'|S]]) :- colocaX(L,T,S).
colocaX(L, [H|T], [L|S]) :- colocaX(H,T,S).

tam([], 0).
tam([H|T], S):-tam(T, G), S is 1 + G.

colocaFlagFim(X, X, [H|T], [H|T]).
colocaFlagFim(X, Y, [H|T], G) :- insereFim('k',[H|T], G).

cifra2a2(0, L, [], []).
cifra2a2(C, L, [H|T], G) :- condicionaCifragem(L,H,S), head(T, HT), tail(T,TT), cifra2a2(C-1, HT, TT, Y), G is conc(S,Y).

condicionaCifragem(L,H,[L]).

matriz([['a','b','c','d','e'],['f','g','h','i','j'], ['k','l','m','n','o'], ['p','q','r','s','t'], ['u','v','w','x','z']]).





:- initialization main.

main:-

	read_line_to_codes(user_input, M),
	string_to_atom(M,M2),
	string_chars(M2,Mensagem),
	
	colocaFlagEspaco(' ',Mensagem,SemEspaco),
	
	tail(SemEspaco,AuxT),
	head(SemEspaco,AuxH),
	colocaX(AuxH,AuxT,OperacaoX),
	
	tam(OperacaoX, TamanhoOperacaoX),
	X is mod(TamanhoOperacaoX,2),
	colocaFlagFim(X, 0, OperacaoX, ComFlag),
	
	matriz(Matriz),
	
	tail(ComFlag,AuxT2a2),
	head(ComFlag,AuxH2a2),
	tam(ComFlag,TamanhoComFlag),
	N is (TamanhoComFlag/2),
	cifra2a2(N, AuxH2a2, AuxT2a2, Cifrado).
	



