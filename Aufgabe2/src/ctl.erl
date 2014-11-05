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
-export([time/0,log/3]).
log(Times,"all",File) ->
  %%{ok,A}=file:open(File, [append]),
  log(Times,"insert",File),
  log(Times,"select",File);
  %%file:close(A);

log(Times,"insert",File) ->
  csv:write("Insertionsort",File),
  csv:write(["Größe","Dauer","Vergleiche","Swaps"],File),
  io:format("~p: T-~p, Z-~p, S-~p~n",["Größe","Dauer","Vergleiche","Swaps"]),
  log(Times,"insert",1,File);


log(Times,"select",File) ->
  csv:write("Selectionsort",File),
  csv:write(["Größe","Dauer","Vergleiche","Swaps"],File),
  io:format("~p: T-~p, Z-~p, S-~p~n",["Größe","Dauer","Vergleiche","Swaps"]),
  log(Times,"select",1,File).

log(Times,"insert",Times,File) ->
  Cur=Times,
  Dauer=dsort:insertionSort(zufall:getNumDecending(Cur)),
  Vergleiche=vsort:insertionSort(zufall:getNumDecending(Cur)),
  Swaps=ssort:insertionSort(zufall:getNumDecending(Cur)),
  csv:write([Cur,Dauer,Vergleiche,Swaps],File),
  io:format("~p: T-~p, Z-~p, S-~p~n",[Cur,Dauer,Vergleiche,Swaps]);

log(Times,"insert",Cur,File) ->
  Dauer=dsort:insertionSort(zufall:getNumDecending(Cur)),
  Vergleiche=vsort:insertionSort(zufall:getNumDecending(Cur)),
  Swaps=ssort:insertionSort(zufall:getNumDecending(Cur)),
  csv:write([Cur,Dauer,Vergleiche,Swaps],File),
  io:format("~p: T-~p, Z-~p, S-~p~n",[Cur,Dauer,Vergleiche,Swaps]),
  log(Times,"insert",Cur+1,File);

log(Times,"select",Times,File) ->
  Cur=Times,
  Dauer=dsort:selectionSort(zufall:getNumDecending(Cur)),
  Vergleiche=vsort:selectionSort(zufall:getNumDecending(Cur)),
  Swaps=ssort:selectionSort(zufall:getNumDecending(Cur)),
  csv:write([Cur,Dauer,Vergleiche,Swaps],File),
  io:format("~p: T-~p, Z-~p, S-~p~n",[Cur,Dauer,Vergleiche,Swaps]);
log(Times,"select",Cur,File) ->
  Dauer=dsort:selectionSort(zufall:getNumDecending(Cur)),
  Vergleiche=vsort:selectionSort(zufall:getNumDecending(Cur)),
  Swaps=ssort:selectionSort(zufall:getNumDecending(Cur)),
  csv:write([Cur,Dauer,Vergleiche,Swaps],File),
  io:format("~p: T-~p, Z-~p, S-~p~n",[Cur,Dauer,Vergleiche,Swaps]),
  log(Times,"select",Cur+1,File).

time() ->
  {Mega,Sec,Micro} = os:timestamp(),
  (Mega*1000000+Sec)*1000000+Micro.