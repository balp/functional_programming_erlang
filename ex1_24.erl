-module(ex1_24).
-export([perimiter/1,area/1,enclose/1,bits/1,bits_tail/1]).
-include_lib("eunit/include/eunit.hrl").

%%% First part the shapes

% I have assumed that triangels are right-angled trianges for simplicity of the math.
% I'm using three shapes for this, the shapes only have basic properies and no position in any way.
%
% A triangle, e.g. a right-angled triables with the legs A amd B.
% A rectangle, with the width and height, W and H
% A circle, with the radious R

% Useing pythagoras theorome to figure out the hypotenose of a right angeles triangle.
hypotenuse(A,B) ->
    math:sqrt((A*A)+(B*B)).

perimiter({triangle,A,B}) ->
    (A+B+hypotenuse(A,B));
perimiter({rectangle,W,H}) ->
    2.0*(W+H);
perimiter({circle,R}) ->
    (2.0*math:pi()*R).

area({triangle,A,B}) ->
    (A*B)/2.0;
area({rectangle,W,H}) ->
    (W*H)*1.0;
area({circle,R}) ->
    R*R*math:pi().

enclose({triangle,A,B}) ->
    {rectangle,A,B};
enclose({rectangle,W,H}) ->
    {rectangle,W,H};
enclose({circle,R}) ->
    {rectangle,2*R,2*R}.

%%% Second part
%
% Bit calculations

% Simple recursion.
bits(0) ->
    0;
bits(N) ->
    bits(N div 2) + N rem 2.

% With tail recursion.
bits_tail(N) ->
    bits_tail(N,0).

bits_tail(0,A) ->
    A;
bits_tail(N,A) ->
    bits_tail(N div 2, A + N rem 2).


% Tests to see the solutions are sane.

%
perimiter_test_() ->
    [?_assert(perimiter({triangle,3,4}) =:= 12.0),
    ?_assert(perimiter({triangle,9,12}) =:= 36.0),
    ?_assert(perimiter({rectangle,3,4}) =:= 14.0),
    ?_assert(perimiter({rectangle,9,12}) =:= 42.0),
    ?_assert(perimiter({circle,1}) =:= 2*math:pi()),
    ?_assert(perimiter({circle,3}) =:= 6*math:pi())
    ].

area_test_() ->
    [?_assert(area({triangle,3,4}) =:= 6.0),
    ?_assert(area({triangle,9,12}) =:= 54.0),
    ?_assert(area({rectangle,3,4}) =:= 12.0),
    ?_assert(area({rectangle,9,12}) =:= 108.0),
    ?_assert(area({circle,1}) =:= math:pi()),
    ?_assert(area({circle,3}) =:= 9*math:pi())
    ].

enclose_test_() ->
    [?_assert(enclose({triangle,3,4}) =:= {rectangle,3,4}),
    ?_assert(enclose({triangle,9,12}) =:= {rectangle,9,12}),
    ?_assert(enclose({rectangle,3,4}) =:= {rectangle,3,4}),
    ?_assert(enclose({rectangle,9,12}) =:= {rectangle,9,12}),
    ?_assert(enclose({circle,1}) =:= {rectangle,2,2}),
    ?_assert(enclose({circle,3}) =:= {rectangle,6,6})
    ].

bits_test_() ->
    [?_assert(bits(7) =:= 3),
    ?_assert(bits(8) =:= 1),
    ?_assert(bits_tail(7) =:= 3),
    ?_assert(bits_tail(8) =:= 1)
    ].

