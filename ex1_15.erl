-module(ex1_15).
-export([xOr_1/2,xOr_2/2,xOr_3/2,maxTree/3,howManyEqual/3]).

xOr_1(A,B) ->
    A and not B or not A and B.

xOr_2(A,B) ->
    (A or B) and (not A or not B).

xOr_3(A,B) ->
    A =/= B.

maxTree(X,Y,Z) ->
    max(X,max(Y,Z)).

howManyEqual(X,X,X) ->
    3;
howManyEqual(_,X,X) ->
    2;
howManyEqual(X,_,X) ->
    2;
howManyEqual(X,X,_) ->
    2;
howManyEqual(_,_,_) ->
    0.

