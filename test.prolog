len([],0).
len([H|T],N) :- len([H1|T],N1), N is N1+1.

head(A).
head([H|T]):- head(T).

partition(Pivot,[],[],[]).
partition(Pivot,[],A,B).
partition(Pivot,[Pivot|Rest],Smaller,Greater) :- partition(Pivot,Rest,Smaller,Greater).
partition(Pivot,[Element|Rest],[Element|smallerRest],Greater) :-
         Element < Pivot,
         partition(Pivot,Rest,smallerRest,Greater).
partition(Pivot,[Element|Rest],Smaller,[Element|greaterRest]) :-
         Element > Pivot,
         partition(Pivot,Rest,Smaller,greaterRest).

median(List,Median) :-
         member(Median,List),
         partition(Median, List, Smaller, Greater),
         head(Smaller),
         head(Greater).

