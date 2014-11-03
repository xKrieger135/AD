%%%-------------------------------------------------------------------
%%% @author JanDennis
%%% @copyright (C) 2014, HAW Hamburg
%%% @doc
%%%
%%% @end
%%% Created : 02. Nov 2014 19:00
%%%-------------------------------------------------------------------
-module(sort).
-author("JanDennis").

%% API
-export([insertionSort/3]).


%%insertionsort(Array,Start,Ende)
insertionSort(Array,Start,Ende) ->
  if Start =< Ende ->
    EWert = ary:getA(Array,Start),
    Index = insertSuche(Array,Start,EWert),
%%     io:format("# C+~p:",[Index]),
%%     io:format("|~p| ~n ",[EWert]),
    io:format("~p - ",[Array]),
    A=ary:setA(Array,Index,EWert),
    io:format("~p~n",[A]),
    insertionSort(A,Start+1,Ende);
  Start>Ende -> Array
  end.

insertSuche(Array,Index,Wert) ->
  Elem=ary:getA(Array,Index-1),
  if
    Index > 0 andalso Elem>Wert->
      A=ary:setA(Array,Index,Elem),
%%           io:format("~p - ",[Index]),
%%           io:format("~p : ",[ary:getA(Array,Index-1)]),
%%           io:format("~p   ",[Wert]),
          insertSuche(A,Index-1,Wert);
    Index =< 0 ->
      Index
  end.