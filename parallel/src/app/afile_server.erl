%%%-------------------------------------------------------------------
%%% @author Shine
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 四月 2018 11:59
%%%-------------------------------------------------------------------
-module(afile_server).
-author("Shine").

%% API
-export([start/1, loop/1]).

start(Dir) -> spawn(afile_server, loop, [Dir]).

loop(Dir) ->
  %% 等待指令
  receive
  %% 格式为 cmd -> do something
  %% 如果收到了客户端的list_dir命令，那么返回文件列表
  %% 其中Client☞客户端的进程pid，用于唯一标识客户端
  %%  模式匹配被用于选择消息
  %% self☞服务器端的进程pid
    {Client, list_dir} ->
      Client ! {self(), file:list_dir(Dir)};
  %% 如果收到了客户端的get_file命令，那么将锁清秋的文件发给客户端
    {Client, {get_file, File}} ->
      Full = filename:join(Dir, File),
      Client ! {self(), file:read_file(Full)};
    {Client, {put_file, Content, NewName}} ->
      %%Content,
      % 注释为另一种方式，写入描述符 Fd。
      % {Ret, FileFd} = file:open(NewName, [write, raw]),
      % file:write(FileFd, Content),
      % file:close(FileFd),
      FullTwo = filename:join(Dir, NewName),
      Ret = file:write_file(FullTwo, Content),
      Client ! {self(), {Ret, FullTwo, Content}}
  end,
  loop(Dir).



