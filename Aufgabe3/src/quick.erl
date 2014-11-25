%%%-------------------------------------------------------------------
%%% @author JanDennis
%%% @copyright (C) 2014, <COMPANY>
%@doc
%%%
%%%@end
%%%Created : 23. Nov 2014 16:33
%%%-------------------------------------------------------------------
-module(quick).

-author("JanDennis").

%%API
-export([sort/1,sortR/1]).

sort(Array) ->
  N=arrayS:lengthA(Array),
  if
    N<12 -> sort:insertionSort(Array);
    true -> sort(Array,0,N-1)
  end.

sort(Array,Links,Rechts) ->
  if
    Links<Rechts ->
      {Ary,TeilElem} = quickSortSwap(Array,Links,Rechts),
      io:format("1 ",[]),
      A=sort(Ary,Links,TeilElem - 1),

      io:format("2 ",[]),
      sort(A,TeilElem + 1,Rechts);
    true -> io:format("WURSTGESCHWADER!~n"),Array
  end.

quickSortSwap(Array,Links,Rechts) ->
  io:format("Start: ~p-~p~n",[Links,Rechts]),
  LinksNeu=Links,
  RechtsNeu=Rechts-1,
  Pivot=arrayS:getA(Array,Rechts),
  {Ary,WertLinks} = while_L_leq_R(Array,LinksNeu,RechtsNeu,Pivot,Links,Rechts),
  io:format("quick ",[]),
  A=tauscheElemente(Ary,WertLinks,Rechts),
  {A,WertLinks}.

while_L_leq_R(Array,LinksAlt,RechtsAlt,Pivot,Links,Rechts) ->
  if
    LinksAlt>RechtsAlt -> {Array,LinksAlt}; % Abbruch durch umgekehrte Anforderung
    true ->
      LinksNeu = count_up_left(Array,LinksAlt,Pivot,Rechts),
      RechtsNeu= count_down_right(Array,Links,RechtsAlt,Pivot),
      io:format("IF: ~p / ~p~n",[LinksNeu,RechtsNeu]),
      if
        LinksNeu<RechtsNeu -> io:format("while ",[]),Ary=tauscheElemente(Array,LinksNeu,RechtsNeu);
        true -> Ary=Array
      end,
      while_L_leq_R(Ary,LinksNeu,RechtsNeu,Pivot,Links,Rechts)
  end.

count_up_left(Array,LinksNeu,Pivot,Rechts) ->
  io:format("Links ~p,~p~n",[LinksNeu,Rechts]),
  Elem=arrayS:getA(Array,LinksNeu),
  if
    Elem=<Pivot andalso LinksNeu<Rechts ->
      count_up_left(Array,LinksNeu+1,Pivot,Rechts);
    true ->LinksNeu
  end.

count_down_right(Array,Links,RechtsNeu,Pivot) ->
  io:format("Rechts ~p,~p~n",[Links,RechtsNeu]),
  Elem=arrayS:getA(Array,RechtsNeu),
  if
    Elem>Pivot andalso Links=<RechtsNeu ->
      count_down_right(Array,Links,RechtsNeu-1,Pivot);
    true ->RechtsNeu
  end.

tauscheElemente(ZuSortierendeObjekte, WertLinks, WertRechts) ->
  io:format("Swap: ~p <-> ~p~n",[WertLinks,WertRechts]),
  Element1  = arrayS:getA(ZuSortierendeObjekte, WertLinks),
  Element2  = arrayS:getA(ZuSortierendeObjekte, WertRechts),
  arrayS:setA(arrayS:setA(ZuSortierendeObjekte, WertLinks, Element2), WertRechts, Element1).

sortR(Array) ->
  sortR(Array,0,arrayS:lengthA(Array)-1).

sortR(Array,Links,Rechts) ->
  if
    Links<Rechts ->
      {Ary,TeilElem} = quickSortSwapR(Array,Links,Rechts),
      io:format("1 ",[]),
      A=sort(Ary,Links,TeilElem - 1),

      io:format("2 ",[]),
      sort(A,TeilElem + 1,Rechts);
    true -> io:format("WURSTGESCHWADER!~n"),Array
  end.

quickSortSwapR(Array,Links,Rechts) ->
  io:format("Start: ~p-~p~n",[Links,Rechts]),
  LinksNeu=Links,
  RechtsNeu=Rechts-1,
  Pivot=arrayS:getA(Array,random:uniform(arrayS:lengthA(Array))),
  {Ary,WertLinks} = while_L_leq_R(Array,LinksNeu,RechtsNeu,Pivot,Links,Rechts),
  io:format("quick ",[]),
  A=tauscheElemente(Ary,WertLinks,Rechts),
  {A,WertLinks}.