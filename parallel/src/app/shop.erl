%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 四月 2018 15:07
%%%-------------------------------------------------------------------
-module(shop).
-author("Shine").

%% API
-export([cost/1]).

cost(orange) -> 3;
cost(newspaper) -> 5;
cost(miki) -> 2;
cost(pears) -> 9;
cost(apples) -> 3.
