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
-export([create/0, add/2, delete/2, eval/1, diff/1, toGraph/1, readlines/1]).

%% AVL - Baum - Create()
create() -> {}.

%% ---------------------------------------------------------------------------------------------------------------------

%%AVL - Baum - Add()
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

%% add(Baum, Value) ->
%%   if
%%     Baum == {}   ->
%%       {{}, {Value, 0}, {}};
%%     Baum /= {}   ->
%%       adden(Baum, Value)
%%   end.
%%
%% adden({LinkerUnterBaum, {Element, Balance}, RechterUnterBaum}, Value) ->
%%   Balance = 0,
%%   if
%%     Element < Value ->
%%       io:format("Fuege in Den Rechten Teilbaum ein:  ~p<~p~n",[Element,Value]),
%%       {LinkerUnterBaum, {Element, Balance}, add(RechterUnterBaum, Value)};
%%     true             ->
%%       io:format("Fuege in Den Linken Teilbaum ein:  ~p>~p~n",[Element,Value]),
%%       {add(LinkerUnterBaum, Value), {Element, Balance}, RechterUnterBaum}
%%   end.

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL - Baum - countHeight

countHeight(Baum) ->
  if
    Baum == {}    ->
      0;
    Baum /= 0     ->
      Baum
  end.


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

getSmallest({{},C,_R}) -> C;
getSmallest({L,_C,_R}) -> getSmallest(L).

%% ---------------------------------------------------------------------------------------------------------------------

%% AVL - Baum - rotateRight

rotateRight() -> true.

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


diff({L,_E,R}) ->
  NL=getMax(L),
  NR=getMax(R),
  NR-NL.

getMax(Tree) ->
  getMax(Tree,0).

getMax({},C) -> C;
getMax({{},_E,R},C) ->
  getMax(R,C+1);
getMax({L,_E,{}},C) ->
  getMax(L,C+1);
getMax({L,_E,R},C) ->
  max(getMax(L,C+1),getMax(R,C+1)).


toGraph(Tree) ->
  file:write_file("test.dot", io_lib:fwrite("digraph avltree\n{\n",[]),[write]),
  writeGraph(Tree),
  file:write_file("test.dot", io_lib:fwrite("}",[]),[append]).

writeGraph({{},_E,{}}) ->ok;
writeGraph({L,E,{}}) ->
  file:write_file("test.dot", io_lib:fwrite("~p -> ~p [label=~p];~n",[E,getElem(L),getMax(L)+1]),[append]),
  writeGraph(L);
writeGraph({{},E,R}) ->
  file:write_file("test.dot", io_lib:fwrite("~p -> ~p [label=~p];~n",[E,getElem(R),getMax(R)+1]),[append]),
  writeGraph(R);
writeGraph({L,E,R}) ->
  file:write_file("test.dot", io_lib:fwrite("~p -> ~p [label=~p];~n",[E,getElem(L),getMax(L)+1]),[append]),
  file:write_file("test.dot", io_lib:fwrite("~p -> ~p [label=~p];~n",[E,getElem(R),getMax(R)+1]),[append]),
  writeGraph(L),
  writeGraph(R).


getElem({_L,E,_R}) -> E.

readlines(FileName) ->
  {ok, Data} = file:read_file(FileName),
  binary:split(Data, [<<"\n">>], [global]).


rotate({L,E,R}) ->
  BO=diff({L,E,R}),
  BUL=diff(L),
  BUR=diff(R),
  if
    BO==-2 andalso BUR==-1 -> rotateRight({L,E,R});
    BO==2  andalso BUL==1  -> rotateLeft({L,E,R});
    BO==-2 andalso BUL==1  -> rotateLeftRight({L,E,R});
    BO==2  andalso BUR==-1 -> rotateRightLeft({L,E,R});
  end.
