-module(kata).
-export([main/0]).
-import(library).

main() -> io:fwrite("Hello world. 1+2=~w~n", [library:kata_add(1, 2)]).
