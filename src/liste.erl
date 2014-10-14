-module(liste).
-compile(export_all).
 
% Create() erstellt unsere ADT Liste  
create() -> {list, {}}.


isEmpty(L) -> L == {list, {}}.
							 


% --------------------------------------------- Laenge --------------------------------------------
%
laenge({list, Liste}) -> if 
							Liste == {} ->
								0;
							Liste /= {} ->
								laenge_(Liste, 1)
						 end.
laenge_({_elem, Rest}, Pos) ->  if
									Rest == {} ->
										Pos;
									Rest /= {} ->
										laenge_(Rest, Pos + 1)
							   	end.
% ------------------------------------------------------------------------------------------------									

% --------------------------------------------- Concat --------------------------------------------
% 
concat({list, Liste}, {list, Liste2}) when Liste == {} andalso Liste2 == {} -> {list, {}};
concat({list, Liste}, {list, Liste2}) -> 
											if
												Liste == {} -> 
													{list, Liste2};
												Liste2 == {} -> 
													{list, Liste};
												Liste /= {} andalso Liste2 /= {} ->
													{list, zusammenkleben(Liste, Liste2)}
											end.
zusammenkleben({First, Rest}, Liste) -> 
										if 
											Rest == {} ->
												{First, Liste};
											Rest /= {} ->	
												{First, zusammenkleben(Rest, Liste)}
										end.
% ------------------------------------------------------------------------------------------------	
									
% --------------------------------------------- Find ---------------------------------------------										
% find: list × elem → pos
find({list,Liste}, Elem) ->	
								if 
									Liste == {} -> 
										{list, Liste};
									Liste /= {} ->
										findElement(Liste, Elem, 1)
								end.							
findElement({First, Rest}, Elem, Counter) -> 
												if 
													First /= Elem andalso Rest == {}  ->
														-1;
													First == Elem ->
														Counter;
													First /= Elem ->
														NewCounter = Counter + 1, findElement(Rest, Elem, NewCounter)
												end.		
% ------------------------------------------------------------------------------------------------

% --------------------------------------------- Retrieve --------------------------------------------
% 
retrieve({list,Liste}, Pos) -> Laenge = laenge({list, Liste}), 
								if 
									Pos > Laenge ->
										{list, Liste};
									Pos < 1 -> 
										{list, Liste};
									Liste == {} -> 
										{list, Liste};
									Liste /= {} ->
										getElement(Liste, Pos, 1)
								end.
getElement({First, Rest}, Pos, Counter) ->  
											if		
												Counter == Pos ->
													First;
												Rest == {} -> 
													{list, {First, Rest}};
												Rest /= {} -> 
													NewCounter = Counter + 1, getElement(Rest, Pos, NewCounter)
											end.			
% ------------------------------------------------------------------------------------------------											   

% --------------------------------------------- Insert --------------------------------------------									   
%			
insert({list, Liste}, Pos, Elem) -> Laenge = laenge({list, Liste}),
									if 
										Liste == {} ->
											{list, {Elem, Liste}};	
										Pos < 1 ->
											{list, Liste};
										Pos > Laenge + 1 ->
											 {list, Liste};
										 Pos =< Laenge + 1 -> 	
											 {list, insertIntoList(Liste, Pos, 1, Elem)}											
									end.
insertIntoList({First, Rest}, Pos, Start, Elem) -> 
													if 
														Start == Pos ->
															{Elem, {First, Rest}};
														Start /= Pos ->
														    {First, insertIntoList(Rest, Pos, Start + 1, Elem)}
													end;	
insertIntoList({}, _,_,Elem) -> {Elem, {}}.	
% ------------------------------------------------------------------------------------------------												

% --------------------------------------------- Delete --------------------------------------------	
% delete: list × pos → list			
delete({list, Liste}, Pos) -> Laenge = laenge({list, Liste}),
								if 
									Liste == {} ->
										{list, Liste};
									Pos > Laenge -> 
										{list, Liste};
									Liste /= {} -> 
										{list, deleteFromList(Liste, Pos, 1)}
								end.		
deleteFromList({First, Rest}, Pos, Start) -> 
												if 
													Pos == Start ->
														Rest;
													Pos /= Start ->
														NewStart = Start + 1, {First, deleteFromList(Rest, Pos, NewStart)}
												end.		
% ------------------------------------------------------------------------------------------------	