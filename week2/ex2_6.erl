-module(ex2_6).
-export([product/1, producttail/1, maximum/1, maximumtail/1]).
-include_lib("eunit/include/eunit.hrl").


%%% Part One product of a list

product([]) -> 1;
product([X|Xs]) -> X*product(Xs).

producttail(Xs) -> producttail(Xs,1).
producttail([],P) -> P;
producttail([X|Xs], P) -> producttail(Xs, X*P).

product_test_() ->
    [?_assert(product([]) =:= 1),
    ?_assert(product([1]) =:= 1),
    ?_assert(product([1,2]) =:= 2),
    ?_assert(product([3,8,19]) =:= 456),
    ?_assert(product([-7,2,3]) =:= -42)
    ].

producttail_test_() ->
    [?_assert(producttail([]) =:= 1),
    ?_assert(producttail([1]) =:= 1),
    ?_assert(producttail([1,2]) =:= 2),
    ?_assert(producttail([3,8,19]) =:= 456),
    ?_assert(producttail([-7,2,3]) =:= -42)
    ].

%%% Part Two, Maximum of a list

maximum([Max]) -> Max;
maximum([X|Xs]) -> max(X,maximum(Xs)).

maximumtail([X|Xs]) -> maximumtail(Xs,X).

maximumtail([], Max) -> Max;
maximumtail([X|Xs], Max) -> maximumtail(Xs, max(X,Max)).

maximum_test_() ->
    [?_assert(maximum([1]) =:= 1),
    ?_assert(maximum([1,2,3,4]) =:= 4),
    ?_assert(maximum([5,3,2,1]) =:= 5),
    ?_assert(maximum([1,4,4,1]) =:= 4),
    ?_assert(maximum([-1,-2,-3,-4]) =:= -1)
    ].

maximumtail_test_() ->
    [?_assert(maximumtail([1]) =:= 1),
    ?_assert(maximumtail([1,2,3,4]) =:= 4),
    ?_assert(maximumtail([5,3,2,1]) =:= 5),
    ?_assert(maximumtail([1,4,4,1]) =:= 4),
    ?_assert(maximumtail([-1,-2,-3,-4]) =:= -1)
    ].
