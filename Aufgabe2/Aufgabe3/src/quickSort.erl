%%%-------------------------------------------------------------------
%%% @author Paddy-Gaming
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Nov 2014 19:35
%%%-------------------------------------------------------------------
-module(quickSort).
-author("Paddy-Gaming").

%% API
-export([quickSort/1]).

quickSort(ZuSortierendeObjekte) ->
  N = arrayS:lengthA(ZuSortierendeObjekte),
  quickSort(ZuSortierendeObjekte, 0, N - 1).

quickSort(ZuSortierendeObjekte, Links, Rechts) ->
          if Links < Rechts ->
                Teilelement = quickSortSwap(ZuSortierendeObjekte, Links, Rechts),
                Neu = quickSort(ZuSortierendeObjekte, Links,  Teilelement - 1),
                quickSort(Neu, Teilelement + 1, Rechts);
             true ->
                ZuSortierendeObjekte
          end.

quickSortSwap(ZuSortierendeObjekte, Links, Rechts) ->
    WertLinks  = Links,
    WertRechts = Rechts - 1,
    Pivot = arrayS:getA(ZuSortierendeObjekte, Rechts),

    if WertLinks =< WertRechts ->
          WertLinksNeu = erhoeheLinks(WertLinks, ZuSortierendeObjekte, Pivot, Rechts),
          WertRechtsNeu = verringereRechts(WertRechts, ZuSortierendeObjekte, Pivot, Links),
          ZuSortierendeObjekteNeu = tauscheElemente(ZuSortierendeObjekte, WertLinks, WertRechts),
          quickSortSwap(ZuSortierendeObjekteNeu, WertLinksNeu, WertRechtsNeu);
       true ->
          tauscheElemente(ZuSortierendeObjekte, WertLinks, Rechts),
          WertLinks
    end.

erhoeheLinks(WertLinks, ZuSortierendeObjekte, Pivot, Rechts) ->
    AktuellesElement = arrayS:getA(ZuSortierendeObjekte, WertLinks),
    if AktuellesElement =< Pivot andalso WertLinks < Rechts ->
          erhoeheLinks(WertLinks + 1, ZuSortierendeObjekte, Pivot, Rechts);
       true ->
        WertLinks
    end.

verringereRechts(WertRechts, ZuSortierendeObjekte, Pivot, Links) ->
    AktuellesElement = arrayS:getA(ZuSortierendeObjekte, WertRechts),

    if Links =< WertRechts andalso AktuellesElement > Pivot ->
        verringereRechts(WertRechts - 1, ZuSortierendeObjekte, Pivot, Links);
       true ->
        WertRechts
    end.


tauscheElemente(ZuSortierendeObjekte, WertLinks, WertRechts) ->
  Element1  = arrayS:getA(ZuSortierendeObjekte, WertLinks),
  Element2  = arrayS:getA(ZuSortierendeObjekte, WertRechts),
  if WertLinks < WertRechts ->
      arrayS:setA(arrayS:setA(ZuSortierendeObjekte, WertLinks, Element2), WertRechts, Element1);
     true ->
       ZuSortierendeObjekte
  end.