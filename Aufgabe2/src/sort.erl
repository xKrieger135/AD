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
    ary:setA(Array,Index,EWert),
    io:format("~nC-~p : ",[Index]),
    io:format("~p   ",[EWert]),
    insertionSort(Array,Start+1,Ende);
  Start>Ende -> Array
  end.

insertSuche(Array,Index,Wert) ->
  if
    Index > 1 ->
      case ary:getA(Array,Index-1)>Wert of
        true -> ary:setA(Array,Index,ary:getA(Array,Index-1)),
          io:format("~p - ",[Index]),
          io:format("~p : ",[ary:getA(Array,Index-1)]),
          io:format("~p   ",[Wert]),
          insertSuche(Array,Index-1,Wert);
        false -> io:fwrite("Fail\n"),Index
      end;
    Index =< 1 ->
      Index
  end.