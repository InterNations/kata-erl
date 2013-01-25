-module(kata).
-export([read_lines/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

read_lines(List) ->
    lists:foldl(fun(Elem, DictIn) -> append_to_dict(Elem, DictIn) end, dict:new(), List).

append_to_dict(Elem, DictIn) ->
    dict:append(lists:sort(Elem), Elem, DictIn).

-ifdef(TEST).

%    [?_assert(add(1, 1) =:= 2),
%     ?_assert(add(1, 2) =:= 3),
%     ?_assert(add(0, 0) =:= 0)
%    ].

 -endif.


