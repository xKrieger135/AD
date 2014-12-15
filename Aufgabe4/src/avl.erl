%%%-------------------------------------------------------------------
%%% @author JanDennis
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Dez 2014 20:56
%%%-------------------------------------------------------------------
-module(avl).
-author("JanDennis").

%% API
-export([create/0,add/2,delete/2,eval/1]).

create() -> {}.

add({}, Value) -> {{}, Value, {}};
add({Left, Current, Right}, Value) ->
  if
    Current >= Value -> {Left, Current, add(Right, Value)};
    true -> {add(Left, Value), Current, Right}
  end.

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