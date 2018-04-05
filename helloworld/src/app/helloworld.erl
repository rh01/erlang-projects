%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 四月 2018 10:42
%%%-------------------------------------------------------------------
-module(helloworld).
-author("Shine").

%% API
-export([start/0,
  stop/0]).

start() ->
  A = 1,
  B = 2,
  test(A, B),
  ok.

stop() ->
  ok.

test(A, B) ->
  io:format("A:~p B:~p", [A, B]),
  ok.

