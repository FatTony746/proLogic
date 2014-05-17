len([],0).
len([_|T],N) :- len(T,N1), N is N1+1.

partition([], M ,[],[]).
partition([], M, _, _).
partition([M|masterList], M, smallerList, greaterList) :- partition(masterList, M, smallerList, greaterList).
partition([E|masterList], M, [E|smallerList], greaterList) :-
        E < M,
        partition(masterList, M, smallerList, greaterList).
partition([E|masterList], M, smallerList, [E|greaterList]) :-
        E > M,
        partition(masterList, M, smallerList, greaterList).

median(L,M) :- partition(L, M, A, B), member(M, L), len(A, half), len(B, half).
