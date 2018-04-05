%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 四月 2018 13:24
%%%-------------------------------------------------------------------
-module(afile_client).
-author("Shine").

%% API
-export([ls/1,get_file/2,put_file/3]).

ls(Server) ->
  %% 发送消息☞llist_dir，发送给Server
  Server ! {self(), list_dir},
  %% 接受消息，通常情况下，发送和接受成对出现，有！必有receive
  %% 接受来自服务器端的请求
  receive
    {Server, FileList} -> FileList
  end.

get_file(Server, File) ->
  Server ! {self(), {get_file, File}},
  receive
    {Server, Content} -> Content
  end.

put_file(Server, File, NewName) ->
  case file:read_file(File) of
    % 注意不能直接发送 file:read_file 内容， file:read_file 返回的是一个元组，需要提取出来 Content 二进制信息
    {ok, Content} ->
    Server ! {self(), {put_file, Content, NewName}},
    receive
      {Server, Result} -> Result
    end;
    {Server, Content1} -> {Content1}
  end.
