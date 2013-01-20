-module(library).
-export([kata_add/2]).
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

kata_add(N, M) -> N + M.

-ifdef(TEST).
kata_add_test_() ->
    [?_assert(kata_add(1, 1) =:= 2),
     ?_assert(kata_add(1, 2) =:= 3),
     ?_assert(kata_add(0, 0) =:= 0)
    ].
-endif.
