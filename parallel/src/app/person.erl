%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 四月 2018 13:42
%%%-------------------------------------------------------------------
-module(person).
-author("Shine").

%% API
-export([]).

init(Name) ->
  io:format("Hello, ~p",Name),
  ok.
