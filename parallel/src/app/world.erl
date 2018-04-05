%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 四月 2018 11:47
%%%-------------------------------------------------------------------
-module(world).
-author("Shine").

%% API
-export([start/0]).



start() ->
  Joe = spawn(person, init,["joe"]),
  Susan = spawn(person, init, ["susna"]),
  %%Susan ! {self(), "hello, my name is susan"},
  io:format(Joe),
  io:format(Susan),
  ok.



