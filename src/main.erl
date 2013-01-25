-module(main).
-export([main/1]).
-import(kata).

main(File) ->
    Result = kata:read_lines(file2lines(File)),

    dict:fold( fun(_Key, Value, _AccIn) -> 
        
%        foo(Value, length(Value))

        if
            length(Value) > 1 ->
                io:fwrite("~s~n", [string:join(Value, " ")]);
            true ->
                false % erlang :D :D :D
        end
    end,
    [] , Result).

foo(_Value, 1) -> false;
foo(Value, _Length) -> io:fwrite("~s~n", [string:join(Value, " ")]).

file2lines(File) ->
   {ok, Bin} = file:read_file(File),
   string2lines(binary:bin_to_list(Bin), []).

string2lines("\n" ++ Str, Acc) -> [lists:reverse(Acc) | string2lines(Str,[])];
string2lines([H|T], Acc)       -> string2lines(T, [H|Acc]);
string2lines([], Acc)          -> [lists:reverse(Acc)].

%string2lines([Str1 | "\n" ++ Str2 ], Acc) -> [Str1 | string2lines(Str2, Acc)];
%string2lines([], Acc) -> Acc.
