%%%-------------------------------------------------------------------
%%% @author JanDennis
%%% @copyright (C) 2014, HAW Hamburg
%%% @doc
%%%
%%% @end
%%% Created : 02. Nov 2014 19:00
%%%-------------------------------------------------------------------
-module(dsort).
-author("JanDennis").

%% API
-export([insertionSort/1,selectionSort/1]).


%%insertionsort(Array,Start,Ende)
insertionSort(Array) ->
  Time = ctl:time(),
  insertionSort(Array,1,ary:lengthA(Array)-1) - Time.

insertionSort(Array,Start,Ende) ->
  if Start =< Ende ->
    EWert = ary:getA(Array,Start),
    Index = insertSuche(Array,Start,EWert),
    A=shiftArray(Array,Index,EWert,Start),
    insertionSort(A,Start+1,Ende);
  Start>Ende -> ctl:time()
  end.

insertSuche(Array,Index,Wert) ->
  Elem=ary:getA(Array,Index-1),
  if
    Index > 0 andalso Elem>Wert->
      A=shiftArray(Array,Index-1,Elem,Index),
          insertSuche(A,Index-1,Wert);
    true ->
      Index
  end.

shiftArray(Array,Pos,Elem,End) ->
  L=ary:lengthA(Array),
 if
   L==0 ->
      ary:setA(Array,Pos,Elem);
   L==Pos ->
     ary:setA(Array,Pos,Elem);
   Pos==End ->
     ary:setA(Array,Pos,Elem);
   true ->
      E=ary:getA(Array,Pos),
      A=ary:setA(Array,Pos,Elem),
      shiftArray(A,Pos+1,E,End)
  end.

selectionSort(Array) ->
  N=ary:lengthA(Array),
  Time=ctl:time(),
  selectionSort(Array,0,N-1) - Time.

selectionSort(Array,Pos,Pos) -> ctl:time();
selectionSort(Array,Pos,End) ->
  Min=ary:getA(Array,Pos),
  IndexMin = sucheMinimum(Array,Min,Pos,Pos),
  A=tausche(Array,Pos,IndexMin),
  selectionSort(A,Pos+1,End).

sucheMinimum(Array,Min,Pos,MinPos) ->
  Elem=ary:getA(Array,Pos),
  L=ary:lengthA(Array),

  if
    Pos+1>L ->
      MinPos;
    true ->
      if
        Min>Elem ->
          sucheMinimum(Array,Elem,Pos+1,Pos);
        true ->
          sucheMinimum(Array,Min,Pos+1,MinPos)
      end
  end.

tausche(Ary,M,M1) ->
  E=ary:getA(Ary,M),
  E1=ary:getA(Ary,M1),
  ary:setA(ary:setA(Ary,M,E1),M1,E).