%%%-------------------------------------------------------------------
%%% @author JanDennis
%%% @copyright (C) 2014, HAW Hamburg
%%% @doc
%%%
%%% @end
%%% Created : 02. Nov 2014 12:01
%%%-------------------------------------------------------------------
-module(zufall).
-author("JanDennis").

%% API
-export([getNumZufall/1,getNumZufall/2,getNumAscending/1,getNumDecending/1]).

%% getNumZufall
%% gibt Array der Größe N mit zufälligen Zahlen zurück
%% Default ist werden Zahlen von 0 bis 1000 generiert.
%% Die Funktion getNumZufall/2 bietet die Möglichkeit die Obergrenze anzupassen
getNumZufall(N) -> A=ary:initA(),fillRandom(A,N,0).

fillRandom(Target,0,_Cur) -> Target;
fillRandom(Target,N,Cur) -> T=ary:setA(Target,Cur,random:uniform(1000)),fillRandom(T,N-1,Cur+1).

getNumZufall(N,Max) -> A=ary:initA(),fillRandom(A,N,0,Max).

fillRandom(Target,0,_Cur,_Max) -> Target;
fillRandom(Target,N,Cur,Max) -> T=ary:setA(Target,Cur,random:uniform(Max)),fillRandom(T,N-1,Cur+1,Max).


%% getNumAscending
%% gibt Array der Größe N mit aufsteigenden Zahlen zurück
getNumAscending(N) -> A=ary:initA(),fillAscending(A,N,0).

fillAscending(Target,0,_Cur) -> Target;
fillAscending(Target,N,Cur) -> T=ary:setA(Target,Cur,Cur),fillAscending(T,N-1,Cur+1).


%% getNumDescending
%% gibt Array der Größe N mit absteigenden Zahlen zurück
getNumDecending(N) -> A=ary:initA(),fillDecending(A,N,0).

fillDecending(Target,0,_Cur) -> Target;
fillDecending(Target,N,Cur) -> T=ary:setA(Target,Cur,N),fillDecending(T,N-1,Cur+1).