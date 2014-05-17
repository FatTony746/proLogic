
len([],0).
len([H|T],N) :- len(T,N1), N is N1+1.

partition([], M ,[],[]).
partition([M|pivotlist], M , A,B) :- partition(pivotlist, M, A, B).
partition([E|pivotlist], M, [E|lesserList],B) :- E < M, 
                    partition(pivotlist, M, lesserList, B).
partition([E|pivotlist], M, A, [E|greaterList]) :- E > M, 
                    partition(pivotlist, M, A, greaterList).

median(L,M) :- partition(L, M, A, B), member(M, L), len(A, total), len(B,total).