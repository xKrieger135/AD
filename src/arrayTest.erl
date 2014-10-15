%%%-------------------------------------------------------------------
%%% @author patrick_steinhauer
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Okt 2014 13:10
%%%-------------------------------------------------------------------
-module(arrayTest).
-author("patrick_steinhauer").

-include_lib("eunit/include/eunit.hrl").

initA_test() ->
  ?assertEqual({array, {list,{}}}, arrayS:initA()).

lengthA1_test() ->
  ?assertEqual(0, arrayS:lengthA(arrayS:initA())).

lengthA2_test() ->
  ?assertEqual(10, arrayS:lengthA(arrayS:setA(arrayS:initA(), 9, a))).

lengthA3_test() ->
  ?assertEqual(1000, arrayS:lengthA(arrayS:setA(arrayS:initA(), 999, a))).

lengthA4_test() ->
  ?assertEqual(100000, arrayS:lengthA(arrayS:setA(arrayS:initA(), 99999, a))).

setA1_test() ->
  Array = arrayS:setA(arrayS:initA(), 0, a), ?assertEqual({array, {list,{a,{}}}}, Array).

setA2_test() ->
  Array = arrayS:setA(arrayS:initA(), 10, a), ?assertEqual({array, {list,{0,{0,{0,{0,{0,{0,{0,{0,{0,{0,{a,{}}}}}}}}}}}}}}, Array).

getA1_test() ->
  Array = arrayS:getA(arrayS:setA(arrayS:initA(), 1000000, a), 1000001), ?assertEqual(a, Array).
