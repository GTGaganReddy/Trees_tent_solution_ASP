%{placeTent(X, Y): lines(X), columns(Y)}.

% Place tents, consider all the free spaces to start with.
{placeTent(X, Y): free(X,Y)}.


% no tents on top of the trees.
%:- placeTent(X, Y), tree(A, B), X == A, Y == B.
%:- placeTent(X, Y), tree(A, B), Y == B, X == A.


% Ensure row and colums sum

% Only N tents in rows.
:- rowsum(A, N), { placeTent(A, B) : rowsum(A, N) } > N.


% Only M tents in columns.
:- colsum(B, M), { placeTent(A, B) : colsum(B, M) } > M.


% No 2 tents adj either horizonalaly or vertically.
:- placeTent(A, B), placeTent(C, B), A-1 == C. 

:- placeTent(A, B), placeTent(C, B), A+1 == C.

:- placeTent(A, B), placeTent(A, C), B+1 == C.

:- placeTent(A, B), placeTent(A, C), B-1 == C.

% Diagonally.
:- placeTent(X, Y), placeTent(X+1,Y+1).

:- placeTent(X, Y), placeTent(X-1,Y-1).

:- placeTent(X, Y), placeTent(X+1,Y-1).

:- placeTent(X, Y), placeTent(X-1,Y+1).

% for every tree, there is a tent, the tent can be up, dowm, left or right
:- tree(A, B), not placeTent(A+1, B); not placeTent(A-1, B); not placeTent(A, B-1); not tree(A,B); not placeTent(A,B+1).

% for every tent there is a tree, up, down, right or left.
:- placeTent(X, Y), not tree(X+1, Y); not tree(X-1, Y); not tree(X, Y-1); not tree(X, Y+1).

% Count the number of trees in the input
num_trees(N) :- N = #count{ X, Y : tree(X, Y) }.

% Count the number of placeTent atoms
num_placeTents(N) :- N = #count{ X, Y : placeTent(X, Y) }.

% Number of trees must equal the number of placeTent atoms
:- num_trees(NumTrees), num_placeTents(NumPlaceTents), NumTrees != NumPlaceTents.


#show placeTent/2.

