-module(ex1_21).
-export([fib/1,perfect/1]).

fib(N) ->
    fib(N,0,1).

fib(0,ACC,_) ->
    ACC;
fib(N,ACC,PART) ->
    fib(N-1, PART, ACC+PART).

% fib(4)
% = fib(4,0,1)
% = fib(3,1,1)
% = fib(2,1,2)
% = fib(1,2,3)
% = fib(0,3,5)
% = 3

perfect(N) when N > 5->
    perfect(0,2,N,N div 2);
perfect(_) ->
    false.

perfect(Acc,Divisor,N,Nover2) when Divisor > Nover2 ->
    Acc + 1 == N;
perfect(Acc,Divisor,N,Nover2) when N rem Divisor == 0 ->
    perfect(Acc + Divisor, Divisor + 1, N, Nover2);
perfect(Acc,Divisor,N,Nover2) ->
    perfect(Acc, Divisor + 1, N, Nover2).
