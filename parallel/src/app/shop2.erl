%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 四月 2018 15:37
%%%-------------------------------------------------------------------
-module(shop2).
-author("Shine").

%% API
-export([total/1]).
-import(lists, [map/2, sum/1]).

total(L) ->
  sum(map(fun({What,N}) -> shop:cost(What) *N end, L)).