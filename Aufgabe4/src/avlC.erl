%%%-------------------------------------------------------------------
%%% @author Patrick Steinhauer und Jan Dennis Bartels
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Dez 2014 15:44
%%%-------------------------------------------------------------------
-module(avlC).
-author("Son-Patrick und Son-Jan").

%% API
%%-export([create/0, add/2, delete/2, eval/1, getElement/1, rotateRight/1, rotateLeft/1, rotate/1, rotateLeftRight/1, toGraph/1]).
-compile(export_all).
%% AVL - Baum - Create()
create() -> {}.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL - Baum - Add()
add(Any, {}) -> Any;
add({}, Value) -> {{}, {Value, 1}, {}};
add({LinkerUnterBaum, {Element, _Height}, RechterUnterBaum}, Value) ->
  if
    Element < Value ->
      io:format("Fuege in Den Rechten Teilbaum ein:  ~p<~p~n", [Element, Value]),
      Baum = {LinkerUnterBaum, {Element, x}, add(RechterUnterBaum, Value)};
    true ->
      io:format("Fuege in Den Linken Teilbaum ein:  ~p>~p~n", [Element, Value]),
      Baum = {add(LinkerUnterBaum, Value), {Element, x}, RechterUnterBaum}
  end,
  io:format("~p~n", [Baum]),
  rotate(setHeight(Baum)).


%% ---------------------------------------------------------------------------------------------------------------------

%% AVL - Baum - Delete
delete({}, _Value) -> {};
delete({LinkerUnterBaum, {Element, _Hoehe}, RechterUnterBaum}, Element) ->
  io:format("~p~n", ["val found."]),
  if
      LinkerUnterBaum == {} -> RechterUnterBaum;
      RechterUnterBaum == {} -> LinkerUnterBaum;
    true ->
      Smallest = getSmallest(RechterUnterBaum),
      {LinkerUnterBaum, {Smallest,x}, delete(RechterUnterBaum, Smallest)}
  end;

delete({LinkerUnterBaum, {Any, _Hoehe}, RechterUnterBaum}, Value) ->
  io:format("Go deeper - ", []),
  if
    Any < Value ->
      io:format("Right~n", []),
      Baum = {LinkerUnterBaum, {Any,x}, delete(RechterUnterBaum, Value)};
    true ->
      io:format("Left~n", []),
      Baum = {delete(LinkerUnterBaum, Value), {Any, x}, RechterUnterBaum}
  end,
  rotate(setHeight(Baum)).

getSmallest({{}, Element, _RechterUnterBaum}) -> Element;
getSmallest({LinkerUnterBaum, _Element, _RechterUnterBaum}) -> getSmallest(LinkerUnterBaum).

%% ---------------------------------------------------------------------------------------------------------------------

%% verbindet alle unter rotates miteinander, damit entschieden werden kann welches genommen werden soll
rotate({}) -> {};
rotate({{}, {E, H}, {}}) -> {{}, {E, H}, {}};
rotate({LinkerUnterBaum, {Element, H}, RechterUnterBaum}) ->
  BO = balance({LinkerUnterBaum, {Element, H}, RechterUnterBaum}),
  BUL = balance(LinkerUnterBaum),
  BUR = balance(RechterUnterBaum),
  io:format("BO:~p  BUL:~p  BUR:~p~n",[BO,BUL,BUR]),
  if
    BO ==  -2  andalso BUL ==  -1    -> io:format("RechtsRotation.~n",[]),rotateRight({LinkerUnterBaum, {Element,H}, RechterUnterBaum});
    BO ==   2  andalso BUR ==   1    -> io:format("LinksRotation.~n",[]),rotateLeft({LinkerUnterBaum, {Element,H}, RechterUnterBaum});
    BO ==  -2  andalso BUL ==   1    -> rotateLeftRight({LinkerUnterBaum, {Element, H}, RechterUnterBaum});
    BO ==   2  andalso BUR ==  -1    -> rotateRightLeft({LinkerUnterBaum, {Element, H}, RechterUnterBaum});
    true ->
      io:format("Keine Rotation notwendig.~n",[]),
      {LinkerUnterBaum, {Element, H}, RechterUnterBaum}
  end.


%% AVL - Baum - rotateRight
rotateRight({{L, {B, _HB}, R2}, {A, _HA}, R1}) ->
  NHA = max(getHeight(R2), getHeight(R1)) + 1,
  NHB = max(getHeight(L), NHA) + 1,
  {L, {B, NHB}, {R2, {A, NHA}, R1}}.

getLeftElem({L, _E, _R}) -> getElement(L).
getRightElem({}) -> {};
getRightElem({_L, _E, R}) -> getElement(R).

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL BAUM rotateLeft()
%% Rotiert den Baum links herum

rotateLeft({L1, {A, _HA}, {L2, {B, _HB}, R}}) ->
  NHA = max(getHeight(L1), getHeight(L2)) + 1,
  NHB = max(getHeight(R), NHA) + 1,
  {{L1, {A, NHA}, L2}, {B, NHB}, R}.

rotateLeftRight(Baum) ->
  io:format("Left & Right~n", []),
  rotateLeftRightNow(Baum).
rotateLeftRightNow({LinkerUnterBaum, Element, RechterUnterBaum}) ->
  Tree = rotateLeft(LinkerUnterBaum),
  io:format("T:~p~n", [Tree]),
  rotateRight({Tree, Element, RechterUnterBaum}).

rotateRightLeft(Baum) ->
  io:format("Right & Left~n", []),
  rotateRightLeftNow(Baum).
rotateRightLeftNow({LinkerUnterBaum, Element, RechterUnterBaum}) ->
  io:format("B:~p~n", [RechterUnterBaum]),
  Tree = rotateRight(RechterUnterBaum),
  io:format("T:~p~n", [Tree]),
  rotateLeft({LinkerUnterBaum, Element, Tree}).


%% ---------------------------------------------------------------------------------------------------------------------

%% AVL BAUM getElementent()
%% holt sich immer den Mittleren Knoten als Element
getElement({}) -> {};
getElement({_LinkerUnterBaum, {Element, _H}, _RechterUnterBaum}) ->
  Element.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL BAUM eval()
%% Debug Funktion für AVL Bäume
eval({}) -> io:format("Empty~n~n", []);
eval({{}, {Elem, H}, {}}) -> io:format("Last Elem - ~p   @ ~p~n~n", [Elem, H]);
eval({L, {E, H}, R}) ->
  io:format("Top   - ~p   @ ~p~n", [E, H]),
  io:format("Left  - ~p~n", [L]),
  io:format("Right - ~p~n~n", [R]),
  io:format("Next -> Left~n", []),
  eval(L),
  io:format("Next -> Right~n", []),
  eval(R).

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL Baum Balance()
%% ist für die Balance in dem AVL Baum zuständig um diese zu bekommen
balance({}) -> 0;
balance({LinkerUnterBaum, _Element, RechterUnterBaum}) ->
  HoeheLinks = getHeight(LinkerUnterBaum),
  HoeheRechts = getHeight(RechterUnterBaum),
  HoeheRechts - HoeheLinks.

getHeight({}) -> 0;
getHeight({_LinkerUnterBaum, {_Element, Hoehe}, _RechterUnterBaum}) -> Hoehe.

%% ---------------------------------------------------------------------------------------------------------------------

%% Funktionen für GraphViz
toGraph(Tree) ->
  File = "test.dot",
  file:write_file(File, io_lib:fwrite("digraph avltree\n{\n", []), [write]),
  writeGraph(Tree, File),
  file:write_file(File, io_lib:fwrite("}", []), [append]),
  os:cmd("exec.bat").

writeGraph({{}, _E, {}}, _File) -> ok;
writeGraph({L, {E, H}, {}}, File) ->
  file:write_file(File, io_lib:fwrite("~p:~p -> ~p;~n", [E, H, getElement(L)]), [append]),
  writeGraph(L, File);
writeGraph({{}, {E, H}, R}, File) ->
  file:write_file(File, io_lib:fwrite("~p:~p -> ~p;~n", [E, H, getElement(R)]), [append]),
  writeGraph(R, File);
writeGraph({L, {E, H}, R}, File) ->
  file:write_file(File, io_lib:fwrite("~p:~p -> ~p;~n", [E, H, getElement(L)]), [append]),
  file:write_file(File, io_lib:fwrite("~p:~p -> ~p;~n", [E, H, getElement(R)]), [append]),
  writeGraph(L, File),
  writeGraph(R, File).

%% ---------------------------------------------------------------------------------------------------------------------

setHeight({LinkerUnterBaum, {Element, _Hoehe}, RechterUnterBaum}) ->
  {LinkerUnterBaum, {Element, max(getHeight(LinkerUnterBaum), getHeight(RechterUnterBaum)) + 1}, RechterUnterBaum}.