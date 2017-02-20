-module(second).
-export([hypotenuse/2,perimiter/2,area/2]).

hypotenuse(A,B) ->
    math:sqrt(first:square(A)+first:square(B)).

perimiter(A,B) ->
    (A+B+hypotenuse(A,B)).

area(A,B) ->
    (A*B)/2.
