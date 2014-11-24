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
  quickSort(ZuSortierendeObjekte, 0, arrayS:lengthA(ZuSortierendeObjekte) - 1).

quickSort(ZuSortierendeObjekte, Links, Rechts) ->
          if Links < Rechts ->
                Teilelement = quickSortSwap(ZuSortierendeObjekte, Links, Rechts),
                quickSort(ZuSortierendeObjekte, Links,  Teilelement - 1),
                quickSort(ZuSortierendeObjekte, Rechts, Teilelement + 1);
             Links > Rechts  ->
                ZuSortierendeObjekte
          end.

quickSortSwap(ZuSortierendeObjekte, Links, Rechts) ->
    WertLinks  = Links,
    WertRechts = Rechts,
    Pivot = arrayS:getA(ZuSortierendeObjekte, Rechts),

    if WertLinks =< WertRechts ->
          erhoeheLinks(WertLinks, ZuSortierendeObjekte, Pivot, Rechts),
          verringereRechts(WertRechts, ZuSortierendeObjekte, Pivot, Links),
          tauscheElemente(ZuSortierendeObjekte, WertLinks, WertRechts);
       true ->
          tauscheElemente(ZuSortierendeObjekte, WertLinks, WertRechts),
          WertLinks
    end.

erhoeheLinks(WertLinks, ZuSortierendeObjekte, Pivot, Rechts) ->
    AktuellesElement = arrayS:getA(ZuSortierendeObjekte, WertLinks),
    if AktuellesElement < Pivot andalso WertLinks < Rechts ->
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
  arrayS:setA(arrayS:setA(ZuSortierendeObjekte, WertLinks, Element2), WertRechts, Element1).