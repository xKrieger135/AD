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
-export([create/0, add/2, delete/2, eval/1, getElement/1, rotateRight/1, rotateLeft/1]).

%% AVL - Baum - Create()
create() -> {}.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL - Baum - Add()
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
      {LinkerUnterBaum, Element, add(RechterUnterBaum, Value)};
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
      {Left,Smallest, delete(Right,Smallest)}
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

rotateRight(Baum) ->
  rotateRightNow(Baum).
rotateRightNow({LinkerUnterBaum, Element, RechterUnterBaum}) ->
  BalanceMinusZwei = diff({LinkerUnterBaum, Element, RechterUnterBaum}) == -2,
  BalanceMinusEins = diff(LinkerUnterBaum) == -1,
  if
     BalanceMinusZwei andalso BalanceMinusEins ->
      {{{}, getElement(goDeeperForRotateRight(LinkerUnterBaum)), {}},getElement(LinkerUnterBaum), {{}, Element, {}}};
    true ->
      {LinkerUnterBaum, Element, RechterUnterBaum}
  end.

goDeeperForRotateRight({LinkerUnterBaum, Element, RechterUnterBaum}) ->
  if
    LinkerUnterBaum /= {} ->
      goDeeperForRotateRight(LinkerUnterBaum);
    true                  ->
      {LinkerUnterBaum, Element, RechterUnterBaum}
  end.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL BAUM rotateLeft()
rotateLeft(Baum) ->
  rotateLeftNow(Baum).
rotateLeftNow({LinkerUnterBaum, Element, RechterUnterBaum}) ->
  BalanceMinusZwei = diff({LinkerUnterBaum, Element, RechterUnterBaum}) == +2,
  BalanceMinusEins = diff(RechterUnterBaum) == +1,
  if
    BalanceMinusZwei andalso BalanceMinusEins ->
%%       {{{}, getElement(goDeeperForRotateLeft(RechterUnterBaum)), {}},getElement(RechterUnterBaum), {{}, Element, {}}};
      {{{}, Element, {}}, getElement(RechterUnterBaum),{{}, getElement(goDeeperForRotateLeft(RechterUnterBaum)), {}}};
    true ->
      {LinkerUnterBaum, Element, RechterUnterBaum}
  end.

goDeeperForRotateLeft({LinkerUnterBaum, Element, RechterUnterBaum}) ->
  if
    RechterUnterBaum /= {} ->
      goDeeperForRotateLeft(RechterUnterBaum);
    true                  ->
      {LinkerUnterBaum, Element, RechterUnterBaum}
  end.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL BAUM getElement()
getElement({_LinkerUnterBaum, Element, _RechterUnterBaum}) ->
  Element.

%% ---------------------------------------------------------------------------------------------------------------------



eval({}) -> io:format("Empty~n~n",[]);
eval({{},Elem,{}}) -> io:format("Last Elem - ~p~n~n",[Elem]);
eval({L,E,R}) ->
  io:format("Top   - ~p~n",[E]),
  io:format("Left  - ~p~n",[L]),
  io:format("Right - ~p~n~n",[R]),
  io:format("Next -> Left~n",[]),
  eval(L),
  io:format("Next -> Right~n",[]),
  eval(R).

diff({L, E, R}) ->
  NL = getMax(L),
  NR = getMax(R),
  NR - NL.

getMax(Tree) ->
  getMax(Tree, 0).

getMax({}, C) -> C;
getMax({{}, _E, R}, C) ->
  getMax(R, C + 1);
getMax({L, _E, {}}, C) ->
  getMax(L, C + 1);
getMax({L, _E, R}, C) ->
  max(getMax(L, C + 1), getMax(R, C + 1)).
