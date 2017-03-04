-module(ex2_15).
-export([onlylowercase/1]).
-include_lib("eunit/include/eunit.hrl").

palindrome(Xs) -> 
    CleanList = onlylowercase(Xs),
    CleanList == lists:reverse(CleanList).

onlylowercase([]) ->
    [];
onlylowercase([X|Xs]) when X >= $a andalso X =< $z ->
    [X|onlylowercase(Xs)];
onlylowercase([X|Xs]) when X >= $A andalso X =< $Z ->
    [X - ($A - $a)|onlylowercase(Xs)];
onlylowercase([_X|Xs]) ->
    onlylowercase(Xs).

palindrome_test_() ->
    [?_assertEqual(true, palindrome("Madam I\'m Adam")),
    ?_assertEqual(true, palindrome("Abba")),
    ?_assertEqual(true, palindrome("abba")),
    ?_assertEqual(false, palindrome("Kalle"))
    ].

