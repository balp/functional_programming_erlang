-module(ex2_2).
-export([second/1]).

head([X|_Xs]) -> X.
tail([_X|Xs]) -> Xs.

second(Xs) -> head(tail(Xs)).
second2([_X,Y|Xs]) -> Y.
