-module(kata).
-export([add/2]).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

add(N, M) -> N + M.

-ifdef(TEST).
add_test_() ->
    [?_assert(add(1, 1) =:= 2),
     ?_assert(add(1, 2) =:= 3),
     ?_assert(add(0, 0) =:= 0)
    ].
-endif.
