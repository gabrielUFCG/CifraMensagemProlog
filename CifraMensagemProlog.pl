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

cifra2a2(C, C, [], MX,[]).
cifra2a2(C, S, [H|T], MX , [R|M]) :-  head(T, HT), condicionaCifragem(H,HT,MX,R), tail(T,TT), N is C-1, cifra2a2(N,0,TT,MX,M).

getElement(Ind, [H|T], C):- Ind== 0 -> C = H; Z is Ind-1, getElement(Z, T, C).

getInd(E, [], 1).
getInd(E, [E|T], 0):-!.
getInd(E, [H|T], Ind):- getInd(E, T, X), Ind is X+1.

getLinha(E, [], 6). 
getLinha(E, [H|T], R) :- getInd(E,H,X), getLinha(E,T,S),(X<5 -> R = 0; R is 1+S) .

getColuna(E, [], 6).
getColuna(E, [H|T], R) :- getInd(E,H,X), getColuna(E,T,S),(X<5 -> R = X; R = S) .

condicionaCifragem(L,H,MX,R) :- getLinha(L,MX,A),getColuna(L,MX,B),getLinha(H,MX,C),getColuna(H,MX,D), cifragem(A,B,C,D,MX,R). 

cifragem(A,B,C,D,MX,R) :- (A == C -> linha(A,B,C,D,MX,R); B == D -> coluna(A,B,C,D,MX,R); retangulo(A,B,C,D,MX,R)).

getElementNaMatriz(L,L,C,[H|T],E) :- getElement(C,H,E).
getElementNaMatriz(L,X,C,[H|T],E) :- XX is X+1,getElementNaMatriz(L,XX,C,T,E).

cons(A,B,[A|B]).

linha(A,B,C,D,MX,R) :- (B == 4 -> BB = 0; BB = B+1),getElementNaMatriz(A,0,BB,MX,RA),(D == 4 ->DD = 0; DD = D+1),getElementNaMatriz(C,0,DD,MX,RB),cons(RA,RB,R).

coluna(A,B,C,D,MX,R) :- (A == 4 -> AA = 0; AA is A+1),getElementNaMatriz(AA,0,B,MX,RA),(C == 4 ->CC = 0; CC is C+1),getElementNaMatriz(CC,0,D,MX,RB),cons(RA,RB,R).

retangulo(A,B,C,D,MX,R) :- getElementNaMatriz(C,0,B,MX,RA),getElementNaMatriz(A,0,D,MX,RB),cons(RA,RB,R).

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
	
	tam(ComFlag,TamanhoComFlag),
	N is (TamanhoComFlag/2),
	cifra2a2(N,0,ComFlag,Matriz,Cifrado),
	write(Cifrado).
	



