%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 四月 2018 20:00
%%%-------------------------------------------------------------------
-module(walks).
-author("Shine").

%% API
-export([]).

%% 类型声明
%% 定义plan_route函数的参数和返回类型
-spec plan_route(From :: point(), To :: point()) -> route().
%% 引入新类型direction，是north，south，east，west其中的一个atom
-type direction() :: north | south | east| west.
%% 输入参数point()类型为包含两个整数的元组
-type point() :: {integer(), integer()}.
%% 返回值类型为三元组
-type route() :: {go, direction(), integer()}.
-type angle() :: {Degrees :: 0..360, Miutes :: 0..60, Seconds :: 0..60}.
-type position() :: {latitude|longtitude, angle()}.



