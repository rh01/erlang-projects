%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 四月 2018 9:21
%%%-------------------------------------------------------------------
-module(geometry).
-author("Shine").

%% API
-export([loop/0,rpc/2]).
rpc(Pid, Request) ->
  Pid ! {self(),Request},
  receive
    Response ->
      Response
  end.




loop() ->
  receive
    {From, {rectangle, H, W}} ->
      From ! H * W,
      io:format("Area of rectangle is ~p~n", [W * H]),
      loop();
    {From, {square, Slide}} ->
      From ! Slide * Slide,
      io:format("Area of square is ~p~n", [Slide * Slide]),
      loop();
    {From, {circle, R}} ->
      From ! 3.14159 * R * R,
      loop();
    {From, Other} ->
      From ! {error, Other},
      loop()
  end.

