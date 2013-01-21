-module(main).
-export([main/0]).
-import(kata).

main() -> io:fwrite("Hello world. 1+2=~w~n", [kata:add(1, 2)]).
