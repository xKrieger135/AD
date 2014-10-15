%%%-------------------------------------------------------------------
%%% @author Paddy-Gaming
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Okt 2014 08:59
%%%-------------------------------------------------------------------
-module(schlangeTest).
-author("Paddy-Gaming").

-include_lib("eunit/include/eunit.hrl").

createQ_test() ->
  ?assertEqual({queue,{{stack,{list,{}}},{stack,{list,{}}}}}, schlange:createQ()).

isEmptyQ1_test() ->
  ?assertEqual(true, schlange:isEmptyQ(schlange:createQ())).

isEmptyQ2_test() ->
  ?assertEqual(false, schlange:isEmptyQ({queue,{{stack,{list,{a,{}}}},{stack,{list,{}}}}})).

front1_test() ->
  ?assertEqual(a, schlange:front({queue,{{stack,{list,{a,{}}}},{stack,{list,{}}}}})).

front2_test() ->
  ?assertEqual(b, schlange:front({queue,{{stack,{list,{a,{}}}},{stack,{list,{b,{c,{}}}}}}})).

enqueue1_test() ->
  ?assertEqual({queue,{{stack,{list,{1,{a,{}}}}},{stack,{list,{b,{c,{}}}}}}}, schlange:enqueue({queue,{{stack,{list,{a,{}}}},{stack,{list,{b,{c,{}}}}}}}, 1)).

enqueue2_test() ->
  ?assertEqual({queue,{{stack,{list,{hallo,{a,{}}}}},{stack,{list,{b,{c,{}}}}}}}, schlange:enqueue({queue,{{stack,{list,{hallo,{a,{}}}}},{stack,{list,{b,{c,{}}}}}}}, hallo)).

enqueue3_test() ->
  ?assertEqual({queue,{{stack,{list,{ende,{hallo,{a,{}}}}}},{stack,{list,{b,{c,{}}}}}}}, schlange:enqueue({queue,{{stack,{list,{hallo,{a,{}}}}},{stack,{list,{b,{c,{}}}}}}}, ende)).