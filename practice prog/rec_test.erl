-module(rec_test).
-export([duplicate/2,tail_duplicate/2,tail_duplicate/3,zip/2,tail_zip/2,tail_zip/3,quick_sort/1,partition/4]).
-compile(export_all).


duplicate(0,_) ->
[];
duplicate(N,Term) when N > 0 ->
[Term|duplicate(N-1,Term)].



tail_duplicate(N,Term) ->
tail_duplicate(N,Term,[]).
 
tail_duplicate(0,_,List) ->
List;
tail_duplicate(N,Term,List) when N > 0 ->
tail_duplicate(N-1, Term, [Term|List]).



zip([],[]) -> [];
zip([X|Xs],[Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].


tail_zip(X,Y) -> tail_zip(X,Y,[]).

tail_zip([],[],List) -> List;

tail_zip([X|Xs],[Y|Ys],List) -> tail_zip(Xs,Ys,[{X,Y}|List]).


quick_sort([]) -> [];
quick_sort([Pivot|Rest]) -> 
{Smaller,Larger} = partition(Pivot,Rest,[],[]),
quick_sort(Smaller) ++ [Pivot] ++ quick_sort(Larger).


partition(_,[],Smaller,Larger) -> {Smaller,Larger};
partition(Pivot,[H|T],Smaller,Larger) ->
  if H =< Pivot -> partition(Pivot,T,[H|Smaller],Larger);
     H > Pivot -> partition(Pivot,T,Smaller,[H|Larger])
  end.

