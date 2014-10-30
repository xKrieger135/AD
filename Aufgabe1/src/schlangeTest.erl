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

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests um zu schauen ob das createQ eine richtige Schlange erstellt.

createQ_test() ->
  ?assertEqual({queue,{{stack,{list,{}}},{stack,{list,{}}}}}, schlange:createQ()).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests, die pruefen ob das isEmptyQ richtig arbeitet und testet ob die Schlange so aussieht wie sie sein soll.

isEmptyQ1_test() ->
  ?assertEqual(true, schlange:isEmptyQ(schlange:createQ())).

isEmptyQ2_test() ->
  ?assertEqual(false, schlange:isEmptyQ({queue,{{stack,{list,{a,{}}}},{stack,{list,{}}}}})).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests, welche schauen, welches Element das erste ist -> im Outstack, da hier ausgelesen wird.

front1_test() ->
  ?assertEqual(a, schlange:front({queue,{{stack,{list,{a,{}}}},{stack,{list,{}}}}})).

front2_test() ->
  ?assertEqual(b, schlange:front({queue,{{stack,{list,{a,{}}}},{stack,{list,{b,{c,{}}}}}}})).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests, die zeigen, dass im Instack ein Element angefügt werden kann.

enqueue1_test() ->
  ?assertEqual({queue,{{stack,{list,{1,{a,{}}}}},{stack,{list,{b,{c,{}}}}}}}, schlange:enqueue({queue,{{stack,{list,{a,{}}}},{stack,{list,{b,{c,{}}}}}}}, 1)).

enqueue2_test() ->
  ?assertEqual({queue,{{stack,{list,{hallo,{a,{}}}}},{stack,{list,{b,{c,{}}}}}}}, schlange:enqueue({queue,{{stack,{list,{a,{}}}},{stack,{list,{b,{c,{}}}}}}}, hallo)).

enqueue3_test() ->
  ?assertEqual({queue,{{stack,{list,{ende,{hallo,{a,{}}}}}},{stack,{list,{b,{c,{}}}}}}}, schlange:enqueue({queue,{{stack,{list,{hallo,{a,{}}}}},{stack,{list,{b,{c,{}}}}}}}, ende)).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests, ob das dequeue richtig funktioniert -> leerer Outstack -> umstapeln von Instack in Outstack -> oberstes Element des Stacks löschen.

dequeue1_test() ->
  ?assertEqual({queue,{{stack,{list,{hallo,{a,{}}}}},{stack,{list,{c,{}}}}}}, schlange:dequeue({queue,{{stack,{list,{hallo,{a,{}}}}},{stack,{list,{b,{c,{}}}}}}})).

dequeue2_test() ->
  ?assertEqual({queue,{{stack,{list,{}}},{stack,{list,{hallo,{}}}}}}, schlange:dequeue({queue,{{stack,{list,{hallo,{a,{}}}}},{stack,{list,{}}}}})).