-module(servers).

-export([add/2,del/2,connect/3,links/2,reachable/2]).

add(Graph, Servers) when list(Servers) ->
 lists:foreach(fun(X) -> digraph:add_vertex(Graph, X) end, Servers);

add(Graph, Server) ->
 digraph:add_vertex(Graph, Server).

del(Graph, Servers) when list(Servers) ->
 lists:foreach(fun(X) -> digraph:del_vertex(Graph, X) end, Servers);

del(Graph, Server) ->
 digraph:del_vertex(Graph, Server).

connect(_Graph, _Server, []) ->
 ok;
connect(Graph, Server, [ {S, L} | Servers ]) ->
 digraph:add_edge(Graph, Server, S, L),
 connect(Graph, Server, Servers);
connect(Graph, Server, [ S | Servers ]) ->
 digraph:add_edge(Graph, Server, S),
 connect(Graph, Server, Servers);
 
% connect(Graph, Server, Servers) when list(Servers) ->
%   lists:foreach(fun(X) -> digraph:add_edge(Graph, Server, X) end, Servers);

connect(Graph, Server, S) ->
 digraph:add_edge(Graph, Server, S).

links(Graph, Server) ->
 lists:map(fun(X) -> {_, S1, S2, Label} = digraph:edge(Graph, X), {S1, S2, Label} end, digraph:edges(Graph, Server)).

reachable(Graph, Server) when list(Server) ->
 digraph_utils:reachable(Server, Graph);
reachable(Graph, Server) ->
 digraph_utils:reachable([Server], Graph).