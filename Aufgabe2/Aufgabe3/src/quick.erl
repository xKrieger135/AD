-module(quick).

-author("JanDennis").

%%API
-export([sort/2]).

sort(Array, PivotAuswahl) ->
  N=arrayS:lengthA(Array),
  if
    N<12 -> sort:insertionSort(Array);
    true -> sort(Array,0,N-1, PivotAuswahl)
  end.

sort(Array,Links,Rechts, PivotAuswahl) ->
  N=arrayS:lengthA(Array),
  if
    N < 12 -> sort:insertionSort(Array);
    %true   -> sort(Array,0,N-1, PivotAuswahl);
    Links < Rechts ->
      {Ary,TeilElem} = quickSortSwap(Array,Links,Rechts, PivotAuswahl),
      A=sort(Ary,Links,TeilElem - 1, PivotAuswahl),

      sort(A,TeilElem + 1,Rechts, PivotAuswahl);
    true -> Array
  end.

quickSortSwap(Array,Links,Rechts, PivotAuswahl) ->
  LinksNeu=Links,
  RechtsNeu=Rechts-1,
  {NewArray,Pivot} = selectPivot(Array,LinksNeu,Rechts,PivotAuswahl),                %%arrayS:getA(Array,Rechts),
  {Ary,WertLinks} = while_L_leq_R(NewArray,LinksNeu,RechtsNeu,Pivot,Links,Rechts),
  A=tauscheElemente(Ary,WertLinks,Rechts),
  {A,WertLinks}.

while_L_leq_R(Array,LinksAlt,RechtsAlt,Pivot,Links,Rechts) ->
  if
    LinksAlt>RechtsAlt -> {Array,LinksAlt}; % Abbruch durch umgekehrte Anforderung
    true ->
      LinksNeu = count_up_left(Array,LinksAlt,Pivot,Rechts),
      RechtsNeu= count_down_right(Array,Links,RechtsAlt,Pivot),
      if
        LinksNeu<RechtsNeu ->Ary=tauscheElemente(Array,LinksNeu,RechtsNeu);
        true -> Ary=Array
      end,
      while_L_leq_R(Ary,LinksNeu,RechtsNeu,Pivot,Links,Rechts)
  end.

count_up_left(Array,LinksNeu,Pivot,Rechts) ->
  Elem=arrayS:getA(Array,LinksNeu),
  if
    Elem=<Pivot andalso LinksNeu<Rechts ->
      count_up_left(Array,LinksNeu+1,Pivot,Rechts);
    true ->LinksNeu
  end.

count_down_right(Array,Links,RechtsNeu,Pivot) ->
  Elem=arrayS:getA(Array,RechtsNeu),
  if
    Elem>Pivot andalso Links=<RechtsNeu ->
      count_down_right(Array,Links,RechtsNeu-1,Pivot);
    true ->RechtsNeu
  end.

tauscheElemente(ZuSortierendeObjekte, WertLinks, WertRechts) ->
  Element1  = arrayS:getA(ZuSortierendeObjekte, WertLinks),
  Element2  = arrayS:getA(ZuSortierendeObjekte, WertRechts),
  arrayS:setA(arrayS:setA(ZuSortierendeObjekte, WertLinks, Element2), WertRechts, Element1).



selectPivot(Array, WertLinks, Rechts, PivotAuswahl) ->
  if
    PivotAuswahl == "r" ->
      NewArray = tauscheElemente(Array, WertLinks+random:uniform(Rechts-WertLinks), Rechts),
      {NewArray,arrayS:getA(NewArray, Rechts)};

    true ->
      {Array,arrayS:getA(Array,Rechts)}
  end.