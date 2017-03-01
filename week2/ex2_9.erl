-module(ex2_9).
-export([double/1, evens/1, median/1]).
-include_lib("eunit/include/eunit.hrl").


double( [] ) -> [] ;
double( [X|Xs] ) -> [ 2*X | double(Xs)] .

double_test_() -> 
    [?_assertEqual([2,4,6], double([1,2,3]))
    ].


evens([]) -> [] ;
evens([X|Xs]) when X rem 2 == 0 -> 
    [X | evens(Xs)];
evens([_X|Xs]) ->
    evens(Xs).

evens_test_() -> 
    [?_assertEqual([2], evens([1,2,3])),
    ?_assertEqual([2,2,6], evens([2,2,6])),
    ?_assertEqual([], evens([1,3,9])),
    ?_assertEqual([8,4], evens([9,8,4]))
    ].

%%% Median

middle_element(Xs) -> 
    {_Start, End} = lists:split(length(Xs) div 2,Xs),
    hd(End).


median(Xs) -> middle_element(lists:sort(Xs)).

median_test_() ->
    [?_assertEqual(2, median([2])),
    ?_assertEqual(2, median([1,2,3])),
    ?_assertEqual(6, median([8,2,4,6]))
    ].
