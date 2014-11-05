%%%-------------------------------------------------------------------
%%% @author JanDennis
%%% @copyright (C) 2014, HAW Hamburg
%%% @doc
%%%
%%% @end
%%% Created : 02. Nov 2014 19:00
%%%-------------------------------------------------------------------
-module(ssort).
-author("JanDennis").

%% API
-export([insertionSort/1,selectionSort/1]).


%%insertionsort(Array,Start,Ende)
insertionSort(Array) ->
  insertionSort(Array,1,ary:lengthA(Array)-1,0).

insertionSort(Array,Start,Ende,Count) ->
  if Start =< Ende ->
    EWert = ary:getA(Array,Start),
    {Index,C} = insertSuche(Array,Start,EWert, Count),
    A=shiftArray(Array,Index,EWert,Start),
    insertionSort(A,Start+1,Ende,C);
  Start>Ende -> Count
  end.

insertSuche(Array,Index,Wert,Count) ->
  Elem=ary:getA(Array,Index-1),
  C=Count+1,
  if
    Index > 0 andalso Elem>Wert->
      A=shiftArray(Array,Index-1,Elem,Index),
          insertSuche(A,Index-1,Wert,C);
    true ->
      {Index,C}
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
  selectionSort(Array,0,N-1, 0).

selectionSort(_Array,Pos,Pos, Count) -> Count;
selectionSort(Array,Pos,End, Count) ->
  Min=ary:getA(Array,Pos),
  {IndexMin, C} = sucheMinimum(Array,Min,Pos,Pos, Count),
  A=tausche(Array,Pos,IndexMin),
%% io:format("~p - ~p  ",[Count,C]),
  selectionSort(A,Pos+1,End, C).

sucheMinimum(Array,Min,Pos,MinPos, Count) ->
  Elem=ary:getA(Array,Pos),
  L=ary:lengthA(Array),

  if
    Pos+1>L ->
      {MinPos, Count};
    true ->
      if
        Min>Elem ->
          sucheMinimum(Array,Elem,Pos+1,Pos, Count);
        true ->
          sucheMinimum(Array,Min,Pos+1,MinPos, Count+1)
      end
  end.

tausche(Ary,M,M1) ->
  E=ary:getA(Ary,M),
  E1=ary:getA(Ary,M1),
  ary:setA(ary:setA(Ary,M,E1),M1,E).