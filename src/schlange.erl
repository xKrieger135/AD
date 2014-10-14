-module(schlange).
-compile(export_all).

createQ() -> {queue, {stack:createS(), stack:createS()}}.

%Front noch richtig fertigstellen.
front({queue, {InStack, OutStack}}) -> case stack:isEmptyS(OutStack) of true -> umstapeln2(InStack, OutStack);
																		false -> stack:top(OutStack) end.

enqueue({queue, {InStack, OutStack}}, Elem) -> {queue, {stack:push(InStack, Elem), OutStack}}.										       
										  										 

	
dequeue({queue, {InStack, OutStack}}) -> case stack:isEmptyS(OutStack) of 
															true ->   umstapeln1(InStack, OutStack);
															false -> {queue, {InStack, stack:pop(OutStack)}} end.
															
umstapeln1(Instack,Outstack) -> case stack:isEmptyS(Instack) of 
					true -> {queue, {Instack, stack:pop(Outstack)}};
					false -> NewOutstack = stack:push(Outstack, stack:top(Instack)), NewInstack = stack:pop(Instack), umstapeln1(NewInstack,NewOutstack) 
					end.

umstapeln2(Instack,Outstack) -> case stack:isEmptyS(Instack) of 
					true -> stack:top(Outstack);
					false -> NewOutstack = stack:push(Outstack, stack:top(Instack)), NewInstack = stack:pop(Instack), umstapeln2(NewInstack,NewOutstack) 
					end.					
															
isEmptyQ({queue, {InStack, OutStack}}) -> stack:isEmptyS(InStack) andalso stack:isEmptyS(OutStack).