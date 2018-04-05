%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 四月 2018 18:06
%%%-------------------------------------------------------------------
-module(try_test).
-author("Shine").

%% API
-export([generate_exception/1, demo1/0, catcher/1, demo2/0, demo3/0]).

%% 生成各种错误
generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> error(a).

%% 封装函数

demo1() -> [catcher(I) || I <- [1, 2, 3, 4, 5]].

catcher(N) ->
  try generate_exception(N) of
    Val -> {N, normal, Val}
  catch
    throw : X -> {N, caught, throw, X};
    exit:X -> {N, caught, exited, X};
    error:X -> {N, caught, error, X}
  end.

demo2() ->
  [{I, (catch generate_exception(I))} || I <- [1, 2, 3, 4, 5]].

demo3() ->
  try
    generate_exception(5)
  catch
    error: X -> {X, erlang:get_stacktrace()}
  end.

