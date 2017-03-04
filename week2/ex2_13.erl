-module(ex2_13).
-export([nub/1]).
-include_lib("eunit/include/eunit.hrl").

nub([]) ->
    [];
nub([X|Xs]) ->
    [X|nub(removeAll(X,Xs))].

removeAll(_,[]) ->
    [];
removeAll(X,[X|Xs]) ->
    removeAll(X,Xs);
removeAll(X,[Y|Xs]) ->
    [Y|removeAll(X,Xs)].

bun([]) ->
    [];
bun([X|Xs]) ->
    case lists:member(X,Xs) of
        true ->
            bun(Xs);
        false ->
            [X|bun(Xs)]
    end.




nub_test_() ->
    [?_assertEqual([2,4,1,3], nub([2,4,1,3,3,1]))].

bun_test_() ->
    [?_assertEqual([2,4,3,1], bun([2,4,1,3,3,1]))].
