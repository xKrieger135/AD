-module(stack).
-compile(export_all).

% --------------------------------------------- CreateS --------------------------------------------
% createS: ∅ → stack
createS() -> {stack, liste:create()}.


% --------------------------------------------- push --------------------------------------------
% push: stack × elem → stack
push({stack, Stack}, Elem) ->  {stack, liste:insert(Stack, 1, Elem)}.

% --------------------------------------------- pop --------------------------------------------
% pop: stack → stack
pop({stack, Stack}) -> {stack, liste:delete(Stack, 1)}.

% --------------------------------------------- top --------------------------------------------
% top: stack → elem
top({stack, Stack}) ->  liste:retrieve(Stack, 1).

% --------------------------------------------- isEmptyS --------------------------------------------
% isEmptyS: stack → bool
isEmptyS({stack, Stack}) -> liste:isEmpty(Stack).