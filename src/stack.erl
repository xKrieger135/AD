-module(stack).
-compile(export_all).

% --------------------------------------------- CreateS --------------------------------------------
% createS: ∅ → stack
% createS erzeugt anhand des creates aus der ADT Liste einen Stack.
createS() -> {stack, liste:create()}.


% --------------------------------------------- push --------------------------------------------
% push: stack × elem → stack
% push fuegt Elemente vorne an den Stack an, was durch das insert aus der ADT Liste geschieht.
push({stack, Stack}, Elem) ->  {stack, liste:insert(Stack, 1, Elem)}.

% --------------------------------------------- pop --------------------------------------------
% pop: stack → stack
% pop entfernt das erste Element des Stacks. Dies passiert durch das delete der ADT Liste.
pop({stack, Stack}) -> {stack, liste:delete(Stack, 1)}.

% --------------------------------------------- top --------------------------------------------
% top: stack → elem
% top zeigt das oberste Element des Stacks.
top({stack, Stack}) ->  liste:retrieve(Stack, 1).

% --------------------------------------------- isEmptyS --------------------------------------------
% isEmptyS: stack → bool
% isEmptyS prüft ob unser Eingabestack leer ist oder nicht. -> isEmpty aus der ADT Liste.
isEmptyS({stack, Stack}) -> liste:isEmpty(Stack).