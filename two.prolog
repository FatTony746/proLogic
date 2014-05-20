% Tony Tran and Miles Douglas
% To run:
%	Call partial(<Start_Point>, <List_Variable>, number of squares to solve).
%   OR complete(<Start_Point>, <List_Variable>)
%
% This program is insanely slow....about 45 minutes to run on a 9x9 grid. 
% Probably because our partial function is garbage.


%Definition of adjacent.
adjacent([X1,Y1], [X2,Y2]) :- (member(X1,[1,2,3]), member(X2,[1,2,3]), member(Y1,[1,2,3]), member(Y2,[1,2,3])), 
             ((X2 is X1, Y2 is Y1-1); (X2 is X1, Y2 is Y1+1); (X2 is X1 -1, Y2 is Y1); (X2 is X1+1, Y2 is Y1)), 
                                                                                  (not(X1 = X2); not(Y1 = Y2)).
% Initial Board State. Taken from example on Piazza.
%init([2,3],46).
%init([2,4],45).
%init([2,6],55).
%init([2,7],74).
%init([3,2],38).
%init([3,5],43).
%init([3,8],78).
%init([4,2],35).
%init([4,8],71).
%init([5,3],33).
%init([5,7],59).
%init([6,2],17).
%init([6,8],67).
%init([7,2],18).
%init([7,5],11).
%init([7,8],64).
%init([8,3],24).
%init([8,4],21).
%init([8,6],1).
%init([8,7],2).

% Initial Board state for a 3x3 grid
%init([1,1],1).
%init([3,3],9).
%init([3,2],4).


% Function that will check if two points are the same.
% It's only used once to double check the fact that the head is added to the path list.
samePoint([X1,Y1], [X2,Y2]) :- X1 is X2, Y1 is Y2.

% Recursive Call for partial, returns the path list.
% Checks to see if potential steps are already in the path list--we don't want [1,1] showing up twice.
% Checks all init definitions to save time. Init definitions are immediately added so that the 
%    program doesn't scan for the position of a known number.
partial(S, [H1, H2|R], N0) :-          N1 is N0-1, 
										   N1 > 0,
                                  adjacent(H1,H2), 
						   partial(S, [H2|R], N1), 
                               not(member(H1, R)), 
                           	   not(member(H2, R)).



% Base case for partial function.
% Just adds the start node to the path.
partial([S1x, S1y], [[S2x, S2y]], N0) :- S2x is S1x,  
										 S2y is S1y, 
				    samePoint([S1x,S1y], [S2x,S2y]), 
				    	 					N0 is 1.
% Helper Function: Just calls partial with a hard-coded 81, so calling complete will only
%   solve the 9x9 grid.
complete(S, Finished) :- partial(S, Finished, 9),
                         show(Finished).

show(Soln) :- reverse(Soln, Forwards), write('\n'),
                   member(Row,[1,2,3,4,5,6,7,8,9]),
                   member(Col,[1,2,3,4,5,6,7,8,9]),
                                       write('\n'),
                    nth1(Value,Forwards,[Row,Col]),
                          write(Value),write('\n'),
                                              fail.
