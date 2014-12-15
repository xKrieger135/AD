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
-export([create/0, add/2, delete/2, countHeightRight/1, countHeightLeft/1]).

%% AVL - Baum - Create()
create() -> {}.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL - Baum - Add()
%% add(Baum, Value) ->
%%   if
%%     Baum == {}   ->
%%       {{}, Value, {}};
%%     Baum /= {}   ->
%%       adden(Baum, Value)
%%   end.
%%
%% adden({LinkerUnterBaum, Element, RechterUnterBaum}, Value) ->
%%   if
%%     Element < Value ->
%%       io:format("Fuege in Den Rechten Teilbaum ein:  ~p<~p~n",[Element,Value]),
%%       {LinkerUnterBaum, Element, add(RechterUnterBaum, Value)};
%%     true             ->
%%       io:format("Fuege in Den Linken Teilbaum ein:  ~p>~p~n",[Element,Value]),
%%       {add(LinkerUnterBaum, Value), Element, RechterUnterBaum}
%%   end.

add(Baum, Value) ->
  if
    Baum == {}   ->
      {{}, {Value, 0}, {}};
    Baum /= {}   ->
%%       changeBalance(adden(Baum, Value))
  adden(Baum, Value)
  end.

adden({LinkerUnterBaum, {Element, Balance}, RechterUnterBaum}, Value) ->
  Balance = 0,
  if
    Element < Value ->
      io:format("Fuege in Den Rechten Teilbaum ein:  ~p<~p~n",[Element,Value]),
      {LinkerUnterBaum, {Element, Balance}, add(RechterUnterBaum, Value)};
    true             ->
      io:format("Fuege in Den Linken Teilbaum ein:  ~p>~p~n",[Element,Value]),
      {add(LinkerUnterBaum, Value), {Element, Balance}, RechterUnterBaum}
  end.

%% ---------------------------------------------------------------------------------------------------------------------
%% Soll die balance später eigentlich regeln noch nicht funktionsfähig
%% AVL - Baum - countHeight

%% changeBalance(Baum) ->
%%       balanceChanger(Baum).
%%
%%
%% balanceChanger({LinkerUnterBaum, {Element, Balance}, RechterUnterBaum}) ->
%% %%   RechterUnterBaumCounter = 0,
%% %%   LinkerUnterBaumCounter = 0,
%%   BalanceCounter = Balance,
%%   if
%%     LinkerUnterBaum == {} andalso RechterUnterBaum == {} ->
%%       {LinkerUnterBaum, {Element, Balance}, RechterUnterBaum};
%%     true                                                 ->
%%       balanceChanger({LinkerUnterBaum, {Element, 1}, RechterUnterBaum})
%%   end.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL - Baum countHeightFromRoot
%% Diese Funktion soll den längsten Weg auf der Rechten Seite bestimmen ohne backtracking leider nicht ganz gelungen bisher
%% countHeightFromRoot(Baum) ->
%%   if
%%     Baum == {} ->
%%       0;
%%     Baum /= {} ->
%%       countHeightFromRootToCrownRight(Baum)
%%   end.
%%
%% countHeightFromRootToCrownRight({LinkerUnterBaum, {_Element, _Balance}, RechterUnterBaum}) ->
%%   if
%%     LinkerUnterBaum /= {} ->
%%       countHeightLeft(LinkerUnterBaum) + 2;
%%     true ->
%%   end

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL - Baum - countHeightRight
countHeightRight(Baum) ->
  if
    Baum == {} ->
      0;
    true       ->
      countHeightRight(Baum, 1)
  end.

countHeightRight({_LinkerUnterBaum, {_Element, _Balance}, RechterUnterBaum}, HeightCounter) ->
  if
    RechterUnterBaum == {} ->
      HeightCounter;
    RechterUnterBaum /= {} ->
      HeightCounterNeu = HeightCounter + 1,
      io:format("RechterUnterbaum:  ~p-----~p~n",[RechterUnterBaum, HeightCounterNeu]),
      countHeightRight(RechterUnterBaum, HeightCounterNeu)
  end.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL - Baum - countHeightLeft
countHeightLeft(Baum) ->
  if
    Baum == {} ->
      0;
    true       ->
      countHeightLeft(Baum, 1)
  end.

countHeightLeft({LinkerUnterBaum, {_Element, _Balance}, _RechterUnterBaum}, HeightCounter) ->
  if
    LinkerUnterBaum == {} ->
      HeightCounter;
    LinkerUnterBaum /= {} ->
      HeightCounterNeu = HeightCounter + 1,
      io:format("LinkerUnterBaum:  ~p-----~p~n",[LinkerUnterBaum, HeightCounterNeu]),
      countHeightLeft(LinkerUnterBaum, HeightCounterNeu)
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

%% ---------------------------------------------------------------------------------------------------------------------

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
