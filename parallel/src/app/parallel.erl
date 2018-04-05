%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 四月 2018 11:38
%%%-------------------------------------------------------------------
-module(parallel).
-author("Shine").

%% API
-export([init/1]).

init(Name) ->
  io:format("Hello, ~p",Name),
  ok.

