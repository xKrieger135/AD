%%%-------------------------------------------------------------------
%%% @author Patrick Steinhauer und Jan Dennis Bartels
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Dez 2014 15:44
%%%-------------------------------------------------------------------
-module(avl).
-author("Son-Patrick und Son-Jan").

%% API
-export([create/0, add/2, delete/2]).

create() -> {}.

%% add({}, Value) -> {{}, {Value}, {}};
%% add({LinkerUnterBaum, Element, RechterUnterBaum}, Value) ->
%%   if
%%     Element < Value ->
%%       io:format("JUHU~n"),
%%         {LinkerUnterBaum, Element, {add(RechterUnterBaum, Value)}};
%%     true             ->
%%       io:format("Wenn die Elf hier ist FALSCH: -> ~p<~p~n",[Element,Value]),
%%         {add(LinkerUnterBaum, Value), Element, RechterUnterBaum}
%%   end.

%% AVL - Baum - Add
add(Baum, Value) ->
  if
    Baum == {}   ->
      {{}, Value, {}};
    Baum /= {}   ->
      adden(Baum, Value)
  end.

adden({LinkerUnterBaum, Element, RechterUnterBaum}, Value) ->
  if
    Element < Value ->
      io:format("Fuege in Den Rechten Teilbaum ein:  ~p<~p~n",[Element,Value]),
      {LinkerUnterBaum, Element, {add(RechterUnterBaum, Value)}};
    true             ->
      io:format("Fuege in Den Linken Teilbaum ein:  ~p>~p~n",[Element,Value]),
      {add(LinkerUnterBaum, Value), Element, RechterUnterBaum}
  end.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL - Baum - Delete
delete({}, _Value) -> {};
delete({Left, Value, Right}, Value) ->
  io:format("~p~n",["val found."]),
  if
    Left == {} -> Right;
    Right== {} -> Left;
    true       ->  Smallest = getSmallest(Right),
      {Left,Smallest,delete(Right,Smallest)}
  end;

delete({Left, Any, Right}, Value) ->
  io:format("Go deeper - ",[]),
  if
    Any<Value -> io:format("Right~n",[]),{Left, Any,delete(Right,Value)};
    true -> io:format("Left~n",[]),{delete(Left,Value),Any,Right}
  end.

getSmallest({{},C,R}) -> C;
getSmallest({L,C,R}) -> getSmallest(L).

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL - Baum - rotateRight

rotateRight() -> true.


%% eval({}) -> io:format("Empty~n~n",[]);
%% eval({{},Elem,{}}) -> io:format("Last Elem - ~p~n~n",[Elem]);
%% eval({L,E,R}) ->
%%   io:format("Top   - ~p~n",[E]),
%%   io:format("Left  - ~p~n",[L]),
%%   io:format("Right - ~p~n~n",[R]),
%%   io:format("Next -> Left~n",[]),
%%   eval(L),
%%   io:format("Next -> Right~n",[]),
%%   eval(R).
