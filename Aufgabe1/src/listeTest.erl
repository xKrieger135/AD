%%%-------------------------------------------------------------------
%%% @author patrick_steinhauer
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Okt 2014 14:20
%%%-------------------------------------------------------------------
-module(listeTest).
-author("patrick_steinhauer").

-include_lib("eunit/include/eunit.hrl").

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Test fuer das Erstellen von Listen.
create_test() ->
  Liste1 = liste:create(), ?assert(Liste1 == {list, {}}).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests fuer das Einfuegen von Werten in eine Liste.

insert1_test() ->
  Liste = liste:create(), ?assertEqual({list, {a,{}}}, liste:insert(Liste, 1, a)).

insert2_test() ->
  ?assertEqual({list, {a,{b,{c,{}}}}}, liste:insert({list, {a,{b,{}}}}, 3, c)).

insert3_test() ->
  ?assertEqual({list, {a,{b,{1,{c,{}}}}}}, liste:insert({list, {a,{b,{c,{}}}}}, 3, 1)).

insert4_test() ->
  ?assertEqual({list, {a,{b,{c,{d,{}}}}}}, liste:insert({list, {a,{b,{c,{}}}}}, 4, d)).

insert5_test() ->
  ?assertEqual({list, {c,{a,{b,{c,{}}}}}}, liste:insert({list, {a,{b,{c,{}}}}}, 1, c)).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------

isEmpty1_test() ->
  Liste1 = liste:create(), ?assertEqual(true, liste:isEmpty(Liste1)).

isEmpty2_test() ->
  Liste1 = liste:create(), ?assertEqual(false, liste:isEmpty(liste:insert(Liste1, 1, x))).

isEmpty3_test() ->
  Liste1 = liste:create(), ?assertNotEqual(false, liste:isEmpty(Liste1)).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------

laenge1_test() ->
  Liste1 = liste:create(), ?assertEqual(0, liste:laenge(Liste1)).

laenge2_test() ->
  Liste1 = liste:insert({list, {c,{a,{b,{c,{}}}}}}, 5, hi), ?assertEqual(6, liste:laenge(liste:insert(Liste1, 6, hallo))).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests fuer das Konkatenieren von Listen.

concat1_test() ->
  Liste1 = liste:create(), Liste2 = liste:create(), ?assertEqual({list, {}}, liste:concat(Liste1, Liste2)).

concat2_test() ->
  Liste1 = liste:create(), Liste2 = {list,{hallo,{du,{noob,{}}}}}, ?assertEqual({list,{hallo,{du,{noob,{}}}}}, liste:concat(Liste1, Liste2)).

concat3_test() ->
  Liste1 = liste:create(), Liste2 = liste:insert({list,{hallo,{du,{noob,{}}}}}, 3, ups), ?assertEqual({list,{hallo,{du,{ups,{noob,{}}}}}}, liste:concat(Liste1, Liste2)).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests fuer das Finden von Elementen an einer bestimmten Position.

retrieve1_test() ->
  Liste = liste:create(), ?assertEqual(Liste, liste:retrieve(Liste, 5)).

retrieve2_test() ->
  Liste = {list,{hallo,{du,{ups,{noob,{}}}}}}, ?assertEqual(Liste, liste:retrieve(Liste, 5)).

retrieve3_test() ->
  Liste = {list,{hallo,{du,{ups,{noob,{}}}}}}, ?assertEqual(du, liste:retrieve(Liste, 2)).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests fuer das herausfinden einer Position anhand eines Elements.

find1_test() ->
  Liste = liste:create(), ?assertEqual(Liste, liste:find(Liste, e)).

find2_test() ->
  Liste = {list,{hallo,{du,{ups,{noob,{}}}}}}, ?assertEqual(-1, liste:find(Liste, x)).

find3_test() ->
  Liste = {list,{hallo,{du,{ups,{noob,{}}}}}}, ?assertEqual(4, liste:find(Liste, noob)).

%%%------------------------------------------------------------------------------------------------------------------------------------------------------------------
%%% Tests fuer das loeschen von Elementen aus einer Liste.

delete1_test() ->
  Liste = {list,{hallo,{du,{ups,{noob,{}}}}}}, ?assertEqual({list,{du,{ups,{noob,{}}}}}, liste:delete(Liste, 1)).

delete2_test() ->
  Liste = {list,{hallo,{du,{ups,{noob,{}}}}}}, ?assertEqual({list,{hallo,{du,{ups,{}}}}}, liste:delete(Liste, liste:laenge(Liste))).

delete3_test() ->
  Liste = {list,{hallo,{du,{ups,{noob,{}}}}}}, ?assertEqual({list,{hallo,{ups,{noob,{}}}}}, liste:delete(Liste, 2)).