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
-export([]).

create() -> {}.

add({}, Value) -> {{}, Value, {}};
add({Left, Current, Right}, Value) ->
  if
    Current >= Value -> {Left, Current, add(Right, Value)};
    true -> {add(Left, Value), Current, Right}
  end.

delete({}, _Value) -> {};
delete({Left, Value, Right}, Value) ->
  if
    Left == {} -> Right;
    Right== {} -> Left;
    true       ->
      Smallest = getSmallest(Right),
      {Left,Smallest,delete(Right,Smallest)}
end.

getSmallest({{},C,R}) -> C;
getSmallest({L,C,R}) -> getSmallest(L).
