% adjacent(,N) -> 

%adjacent(X1,Y1,X2,Y2) :- X1 \= 10, Y1 \= 10, X2 \= 10, Y2 \= 10, X1 \= 0, Y1 \= 0, X2 \= 0, Y2 \= 0.  

adjacent(X1,Y1,X2,Y2) :- (member(X1,[1,2,3]), member(X2,[1,2,3]), member(Y1,[1,2,3]), member(Y2,[1,2,3])), ((X2 is X1, Y2 is Y1-1); (X2 is X1, Y2 is Y1+1); (X2 is X1 -1, Y2 is Y1); (X2 is X1+1, Y2 is Y1)), (not(X1 = X2) ; not(Y1 = Y2)).


init(1,1,1).
init(2,3,4).
init(3,1,9).

vars(V) :- init(X,Y,V).
cord(X,Y) :- init(X,Y,V).

%init(X2,Y2,3) :- pathA(1,1,X1,Y1,X2,Y2,2,3).
%pathA(1,1,X1,Y1,X2,Y2,2,3)  :- adjacent(1,1,X1,Y1), adjacent(X1,Y1,X2,Y2), adjacent(X2,Y2,2,3), not(cord(X1,Y1)),not(cord(X2,Y2) ). 
%pathB(2,3,X3,Y3,X4,Y4,X5,Y5,X6,Y6,3,1) :- adjacent(1,1,X3,Y3), adjacent(X4,Y4,X5,Y5), 
                                            %adjacent(X5,Y5,X6,Y6),adjacent(X6,Y6,2,3), not(cord(X3,Y3)),not(cord(X4,Y4)),
                                            %not(cord(X5,Y5)),not(cord(X6,Y6)).
%init(X1,Y1,2) :- pathA(1,1,X1,Y1,X2,Y2,2,3).
%pathA(1,1,X1,Y1,X2,Y2,2,3) :- init(X1,Y1,2), init(X2,Y2,3).
square(X1,Y1, 2):- adjacent(X1,Y1,X2,Y2), init(X2,Y2,1).
square(X1,Y1,8):- adjacent(X1,Y1,X2,Y2), init(X2,Y2,9).
square(X1,Y1,V1) :- adjacent(X1,Y1,X2,Y2), ( init(X2,Y2, (NV1 is V1 - 1)); square(X2,Y2, (NV1 is V1 - 1))), adjacent(X1,Y1,X3,Y3), ( init(X3,Y3, (NV1 is V1 + 1)); square(X3,Y3, (NV1 is V1 + 1))) .



