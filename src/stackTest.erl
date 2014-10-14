%%%-------------------------------------------------------------------
%%% @author Paddy-Gaming
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Okt 2014 21:56
%%%-------------------------------------------------------------------
-module(stackTest).
-author("Paddy-Gaming").

-include_lib("eunit/include/eunit.hrl").

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests fuer das richtige Erstellen eines Stacks.

createS_test() ->
  Stack = stack:createS(), ?assertEqual({stack,{list,{}}}, Stack).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests, die Pruefen ob ein Stack leer ist.

isEmptyS1_test() ->
  Stack = stack:createS(), ?assertEqual(true, stack:isEmptyS(Stack)).

isEmptyS2_test() ->
  Stack = stack:push(stack:createS(), a), ?assertEqual(false, stack:isEmptyS(Stack)).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests, welcheueberpruefen, ob das rauflegen auf den Stack funktioniert.

push1_test() ->
  Stack = stack:push(stack:createS(), a), ?assertEqual({stack,{list,{a,{}}}}, Stack).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests, die testen ob das obserste Element des Stacks entfernt werden kann.

pop1_test() ->
  Stack = stack:push(stack:createS(), a), ?assertEqual({stack,{list,{}}}, stack:pop(Stack)).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests, die zeigen, dass das oberste Element auf dem Stack auch wirklich das obserste ist.

top1_test() ->
  Stack = stack:push(stack:createS(), a), ?assertEqual(a, stack:top(Stack)).