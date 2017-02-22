-module(ex1_19).
-export([fib/1,pieces/1,pieces2/1]).

fib(0) ->
    0;
fib(1) ->
    1;
fib(N) ->
    fib(N-1) + fib(N-2).

% fib(4)
% = fib(3)+fib(2)
% = (fib(2)+fib(1))+(fib(1)+fib(0))
% = ((fib(1)+fib(0))+1)+(1+0)
% = ((1+0)+1)+(1+0)
% = (1+1)+(1)
% = 3

tri(0) ->
    0;
tri(N) when N>0 ->
    tri(N-1) + N.

pieces(N) ->
    tri(N) + 1.

pieces2(0) ->
    1;
pieces2(N) ->
    N + pieces2(N-1).


