%%%-------------------------------------------------------------------
%%% @author JanDennis
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Nov 2014 09:50
%%%-------------------------------------------------------------------
-module(csv).
-author("JanDennis").

%% API
-export([write/2]).

%% IN: write([Anzahl_Elem, Dauer, Anzahl_Zugriffe, Anzahl_Swaps],File)
write([A,B,C,D],File) ->
  file:write_file(File, io_lib:fwrite("~p,~p,~p,~p\n",[A,B,C,D])).
write(String,File) ->
  file:write_file(File,io_lib:fwrite("~p\n",[String])).