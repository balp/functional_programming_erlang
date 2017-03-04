-module(ex2_11).
-export([]).
-include_lib("eunit/include/eunit.hrl").

-spec take(integer(), [T]) -> [T].


take(0,_Xs) ->
    [];
take(_N,[]) ->
    [];
take(N,[X|Xs]) when N > 0->
    [X|take(N-1,Xs)].


take_test_() -> 
    [?_assertEqual([], take(0,"hello")),
    ?_assertEqual("hell", take(4,"hello")),
    ?_assertEqual("hello", take(5,"hello")),
    ?_assertEqual("hello", take(9,"hello"))
    ].

