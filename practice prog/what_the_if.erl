-module(what_the_if).
-export([heh_fine/0,oh_god/1,help_me/1,len/1,tail_fac/1,tail_fac/2,tail_len/1,tail_len/2]).
 
 
heh_fine() ->
if 1 =:= 1 ->
works
end,
if 1 =:= 2; 1 =:= 1 ->
works
end,
if 1 =:= 2, 1 =:= 1 ->
fails
end.

oh_god(N) ->
if N =:= 2 -> might_succeed;
true -> always_does  %% this is Erlang's if's 'else!'
end.


%% note, this one would be better as a pattern match in function heads!
%% I'm doing it this way for the sake of the example.
help_me(Animal) ->
Talk = if Animal == cat  -> "meow";
Animal == beef -> "mooo";
Animal == dog  -> "bark";
Animal == tree -> "bark";
true -> "fgdadfgna"
end,
{Animal, "says " ++ Talk ++ "!"}.

%% Length of a list 
len([]) -> 0;
len([_|T]) -> 1 + len(T).


%% Factorial using tail recursion
tail_fac(N) -> tail_fac(N,1).
 
tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1,N*Acc).


%% Length of a list using tail recursion
tail_len(L) -> tail_len(L,0).
 
tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T,Acc+1).