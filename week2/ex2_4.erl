-module(ex2_4).
-export([sum/1,sumtail/1]).

sum([]) -> 0;
sum([X|Xs]) -> X + sum(Xs).

sumtail([],S) -> S;
sumtail([X|Xs], S) -> sumtail(Xs, S+X).

sumtail(Xs) -> sumtail(Xs,0).
