%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 四月 2018 15:27
%%%-------------------------------------------------------------------
-module(lib_misc).
-author("Shine").

%% API
-export([for/3, qsort/1, pythag/1]).
for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I + 1, Max, F)].

%% 一个简单的排序算法
qsort([]) -> [];
qsort([Pivot | T]) ->
  qsort([X || X <- T, X < Pivot])
  ++ [Pivot] ++
  qsort([X || X <- T, X >= Pivot]).

%% 毕达哥拉斯三元数组
pythag(N) ->
  [{A,B,C} ||
    A <- lists:seq(1, N),
    B<- lists:seq(1, N),
    C <- lists:seq(1, N),
    A +B+C =< N,
    A*A +B*B =:= C*C
    ].


