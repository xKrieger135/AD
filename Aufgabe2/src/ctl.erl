%%%-------------------------------------------------------------------
%%% @author JanDennis
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Nov 2014 09:49
%%%-------------------------------------------------------------------
-module(ctl).
-author("JanDennis").

%% API
-export([log/3]).
log(Times,"all",File) ->
  log(Times,"insert",File),
  log(Times,"select",File).

log(Times,"insert",File) ->
  csv:write("Insertionsort",File),
  csv:write(["Größe","Dauer","Vergleiche","Swaps"],File),
  io:format("~p: T-~p, Z-~p, S-~p~n",["Größe","Dauer","Vergleiche","Swaps"]),
  log(Times,"insert",1,File).

log(Times,"insert",Times+1,_File) -> true.
log(Times,"insert",Cur,File) ->
  Dauer=Dsort:insertionSort(zufall:getNumDecending(Cur)),
  Vergleiche=Vsort:insertionSort(zufall:getNumDecending(Cur)),
  Swaps=Ssort:insertionSort(zufall:getNumDecending(Cur)),
  csv:write([Cur,Dauer,Vergleiche,Swaps],File),
  io:format("~p: T-~p, Z-~p, S-~p~n",[Cur,Dauer,Vergleiche,Swaps]),
  log(Times,"insert",Cur+1,File).

log(Times,"select",File) ->
  csv:write("Selectionsort",File),
  csv:write(["Größe","Dauer","Vergleiche","Swaps"],File),
  io:format("~p: T-~p, Z-~p, S-~p~n",["Größe","Dauer","Vergleiche","Swaps"]),
  log(Times,"select",1,File).

log(Times,"select",Times+1,_File) -> true.
log(Times,"select",Cur,File) ->
  Dauer=Dsort:selectionSort(zufall:getNumDecending(Cur)),
  Vergleiche=Vsort:selecttionSort(zufall:getNumDecending(Cur)),
  Swaps=Ssort:selectionSort(zufall:getNumDecending(Cur)),
  csv:write([Cur,Dauer,Vergleiche,Swaps],File),
  io:format("~p: T-~p, Z-~p, S-~p~n",[Cur,Dauer,Vergleiche,Swaps]),
  log(Times,"select",Cur+1,File).