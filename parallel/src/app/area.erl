%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 四月 2018 14:57
%%%-------------------------------------------------------------------
-module(area).
-author("Shine").

%% API
-export([test/0,area/1]).

%% 函数名 ->
%%未从模块里导出的函数只能在模块内调用。已导出函数就相当于面向对象编程语言（OOPL）
%%里的公共方法，未导出函数则相当于OOPL里的私有方法。
%%给代码添加测试
test() ->
  12 = area({ractangle, 3, 4}),
  144 = area({sqare, 12}),
  test_worked.

area({ractangle, Width, Height}) -> Width * Height;
area({cicle, Redius}) -> 3.14159 * Redius * Redius;
area({square, Side}) -> Side * Side.