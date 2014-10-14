-module(stack).
-compile(export_all).

createS() -> {stack, liste:create()}.

push({stack, Stack}, Elem) ->  {stack, liste:insert(Stack, 1, Elem)}.

pop({stack, Stack}) -> {stack, liste:delete(Stack, 1)}.

top({stack, Stack}) ->  liste:retrieve(Stack, 1).

isEmptyS({stack, Stack}) -> liste:isEmpty(Stack).