%%%-------------------------------------------------------------------
%%% @author Paddy-Gaming
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Dez 2014 14:10
%%%-------------------------------------------------------------------
-module(testAVL).
-author("Paddy-Gaming").

-include_lib("eunit/include/eunit.hrl").

add_test() ->
  ?assertEqual({{}, 1, {}}, avl:add(avl:create(), 1)).


add2_test() ->
  Add = {{}, 1, {}},
  ?assertEqual({{}, 1, {{}, 2, {}}}, avl:add(Add, 2)).

add3_test() ->
  Add = {{}, 100, {}},
  Add2 = avl:add(Add, 291),
  Add3 = avl:add(Add2, 92),
  Add4 = avl:add(Add3, 77),
  ?assertEqual({{}, 100, {{}, 291, {}}}, avl:add(Add, 291)),
  ?assertEqual({{{}, 92, {}}, 100, {{}, 291, {}}}, avl:add(Add2, 92)),
  ?assertEqual({{{{}, 77, {}}, 92, {}}, 100, {{}, 291, {}}}, avl:add(Add3, 77)),
  ?assertEqual({{{{}, 77, {}}, 92, {{}, 93, {}}}, 100, {{}, 291, {}}}, avl:add(Add4, 93)).

delete_test() ->
  Delete = {{}, 100, {}},
  Delete2 = {{}, 100, {{}, 291, {}}},
  Delete3 = {{{}, 92, {}}, 100, {{}, 291, {}}},
  Delete4 = {{{{}, 77, {}}, 92, {}}, 100, {{}, 291, {}}},
  Delete5 = {{{{}, 77, {}}, 92, {{}, 93, {}}}, 100, {{}, 291, {}}},
  ?assertEqual({}, avl:delete(Delete, 100)),
  ?assertEqual({{}, 100, {}}, avl:delete(Delete2, 291)),
  ?assertEqual({{}, 100, {{}, 291, {}}}, avl:delete(Delete3, 92)),
  ?assertEqual({{{}, 92, {}}, 100, {{}, 291, {}}}, avl:delete(Delete4, 77)),
  ?assertEqual({{{{}, 77, {}}, 93, {}}, 100, {{}, 291, {}}}, avl:delete(Delete5, 92)).

%% rotateRight_test() ->
%%   ?assertEqual().
