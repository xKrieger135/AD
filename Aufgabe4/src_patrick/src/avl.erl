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
-export([create/0, add/2, delete/2, eval/1, getElement/1, rotateRight/1, rotateLeft/1, rotate/1, rotateLeftRight/1]).

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
delete({LinkerUnterBaum, Element, RechterUnterBaum}, Element) ->
  io:format("~p~n",["val found."]),
  if
    LinkerUnterBaum == {} -> RechterUnterBaum;
    RechterUnterBaum == {} -> LinkerUnterBaum;
    true       ->  Smallest = getSmallest(RechterUnterBaum),
      {LinkerUnterBaum,Smallest, delete(RechterUnterBaum,Smallest)}
  end;

delete({LinkerUnterBaum, Any, RechterUnterBaum}, Value) ->
  io:format("Go deeper - ",[]),
  if
    Any < Value ->
      io:format("Right~n",[]),
      {LinkerUnterBaum, Any,delete(RechterUnterBaum, Value)};
    true ->
      io:format("Left~n",[]),
      {delete(LinkerUnterBaum, Value), Any, RechterUnterBaum}
  end.

getSmallest({{}, Element,_RechterUnterBaum}) -> Element;
getSmallest({LinkerUnterBaum, _Element, _RechterUnterBaum}) -> getSmallest(LinkerUnterBaum).

%% ---------------------------------------------------------------------------------------------------------------------

%% verbindet alle unter rotates miteinander, damit entschieden werden kann welches genommen werden soll
rotate({LinkerUnterBaum, Element, RechterUnterBaum}) ->
  BalanceMinusZwei = balance({LinkerUnterBaum, Element, RechterUnterBaum}) == - 2,
  BalanceMinusEins = balance(LinkerUnterBaum) == - 1,
  BalancePlusZwei = balance({LinkerUnterBaum, Element, RechterUnterBaum}) == + 2,
  BalancePlusEins = balance(RechterUnterBaum) == + 1,
%%   BO= balance({LinkerUnterBaum, Element, RechterUnterBaum}),
%%   BUL= balance(LinkerUnterBaum),
%%   BUR= balance(RechterUnterBaum),
  if
     BalanceMinusZwei andalso BalanceMinusEins  -> rotateRight({LinkerUnterBaum, Element, RechterUnterBaum});
     BalancePlusZwei andalso BalancePlusEins    -> rotateLeft({LinkerUnterBaum, Element, RechterUnterBaum});
%%     BO == 2  andalso BUL == 1  -> rotateLeft({LinkerUnterBaum, Element, RechterUnterBaum})
%%     BO == -2 andalso BUL == 1  -> rotateLeftRight({LinkerUnterBaum, Element, RechterUnterBaum});
%%     BO == 2  andalso BUR == -1 -> rotateRightLeft({LinkerUnterBaum, Element, RechterUnterBaum})
    true ->
      {LinkerUnterBaum, Element, RechterUnterBaum}
  end.



%% AVL - Baum - rotateRight
rotateRight(Baum) ->
  rotateRightNow(Baum).
rotateRightNow({LinkerUnterBaum, Element, RechterUnterBaum}) ->
  BalanceMinusZwei = balance({LinkerUnterBaum, Element, RechterUnterBaum}) == -2,
  BalanceMinusEins = balance(LinkerUnterBaum) == -1,
  if
     BalanceMinusZwei andalso BalanceMinusEins ->
      {{{}, getElement(goDeeperForRotateRight(LinkerUnterBaum)), {}},getElement(LinkerUnterBaum), {{}, Element, {}}};
     true ->
      if
        RechterUnterBaum /= {} ->
          {rotateRightNow(LinkerUnterBaum),Element,RechterUnterBaum};
%%           {rotate(LinkerUnterBaum),Element,RechterUnterBaum};
        true ->
          {LinkerUnterBaum, Element, RechterUnterBaum}
      end

  end.

%% AVL BAUM goDeeperForRotateRight({LinkerUnterBaum, Element, RechterUnterBaum})
%% geht im rechten Teilbaum tiefer um bei den tiefsten Knoten prüfen zu können ob die Bedingung zuschlägt für eine
%% Rechtsrotation
goDeeperForRotateRight({LinkerUnterBaum, Element, RechterUnterBaum}) ->
  if
    LinkerUnterBaum /= {} ->
      goDeeperForRotateRight(LinkerUnterBaum);
    true                  ->
      {LinkerUnterBaum, Element, RechterUnterBaum}
  end.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL BAUM rotateLeft()
%% Rotiert den Baum links herum
rotateLeft(Baum) ->
  rotateLeftNow(Baum).
rotateLeftNow({LinkerUnterBaum, Element, RechterUnterBaum}) ->
  BalancePlusZwei = balance({LinkerUnterBaum, Element, RechterUnterBaum}) == + 2,
  BalancePlusEins = balance(RechterUnterBaum) == + 1,
  if
    BalancePlusZwei andalso BalancePlusEins ->
      {{{}, Element, {}}, getElement(RechterUnterBaum),{{}, getElement(goDeeperForRotateLeft(RechterUnterBaum)), {}}};
    true ->
        if
          LinkerUnterBaum /= {} ->
          {LinkerUnterBaum, Element, rotateLeftNow(RechterUnterBaum)};
          true ->
            {LinkerUnterBaum, Element, RechterUnterBaum}
        end

  end.

%% AVL BAUM goDeeperForRotateLeft({LinkerUnterBaum, Element, RechterUnterBaum})
%% geht im Linken Teilbaum tiefer um die untersten Knoten zu untersuchen bezüglich der Linksrotation
goDeeperForRotateLeft({LinkerUnterBaum, Element, RechterUnterBaum}) ->
  if
    RechterUnterBaum /= {} ->
      goDeeperForRotateLeft(RechterUnterBaum);
    true                  ->
      {LinkerUnterBaum, Element, RechterUnterBaum}
  end.

rotateLeftRight(Baum) ->
  rotateLeftRightNow(Baum).
rotateLeftRightNow({LinkerUnterBaum, Element, RechterUnterBaum})  ->
  BalanceMinusZwei = balance({LinkerUnterBaum, Element, RechterUnterBaum}) == - 2,
  BalancePlusEins = balance(RechterUnterBaum) == + 1,
  if
    BalanceMinusZwei andalso BalancePlusEins ->
          {{{}, Element, {}}, getElement(RechterUnterBaum),{{}, getElement(goDeeperForRotateLeft(RechterUnterBaum)), {}}};
    true ->
      if
        LinkerUnterBaum /= {} ->
          {LinkerUnterBaum, Element, rotateLeftRightNow(RechterUnterBaum)};
        true ->
          {LinkerUnterBaum, Element, RechterUnterBaum}
      end

  end.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL BAUM getElement()
%% holt sich immer den Mittleren Knoten als Element
getElement({_LinkerUnterBaum, Element, _RechterUnterBaum}) ->
  Element.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL BAUM eval()
%% Debug Funktion für AVL Bäume
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

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL Baum Balance()
%% ist für die Balance in dem AVL Baum zuständig um diese zu bekommen
balance({LinkerUnterBaum, _Element, RechterUnterBaum}) ->
  HoeheLinks = getHeight(LinkerUnterBaum),
  HoeheRechts = getHeight(RechterUnterBaum),
  HoeheRechts - HoeheLinks.

getHeight(Baum) ->
  getHeight(Baum, 0).

getHeight({}, C) -> C;
getHeight({{}, _E, R}, C) ->
  getHeight(R, C + 1);
getHeight({L, _E, {}}, C) ->
  getHeight(L, C + 1);
getHeight({L, _E, R}, C) ->
  max(getHeight(L, C + 1), getHeight(R, C + 1)).

%% ---------------------------------------------------------------------------------------------------------------------

%% Funktionen für GraphViz
%% toGraph(Tree) ->
%%   file:write_file("test.dot", io_lib:fwrite("digraph avltree\n{\n",[]),[write]),
%%   writeGraph(Tree),
%%   file:write_file("test.dot", io_lib:fwrite("}",[]),[append]).
%%
%% writeGraph({{},_E,{}}) ->ok;
%% writeGraph({L,E,{}}) ->
%%   file:write_file("test.dot", io_lib:fwrite("~p -> ~p [label=~p];~n",[E,getElem(L), getHeight(L)+1]),[append]),
%%   writeGraph(L);
%% writeGraph({{},E,R}) ->
%%   file:write_file("test.dot", io_lib:fwrite("~p -> ~p [label=~p];~n",[E,getElem(R), getHeight(R)+1]),[append]),
%%   writeGraph(R);
%% writeGraph({L,E,R}) ->
%%   file:write_file("test.dot", io_lib:fwrite("~p -> ~p [label=~p];~n",[E,getElem(L), getHeight(L)+1]),[append]),
%%   file:write_file("test.dot", io_lib:fwrite("~p -> ~p [label=~p];~n",[E,getElem(R), getHeight(R)+1]),[append]),
%%   writeGraph(L),
%%   writeGraph(R).
%%
%% readlines(FileName) ->
%%   {ok, Data} = file:read_file(FileName),
%%   binary:split(Data, [<<"\n">>], [global]).

%% ---------------------------------------------------------------------------------------------------------------------

