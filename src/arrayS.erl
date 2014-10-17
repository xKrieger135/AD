-module(arrayS).
-compile(export_all).

% --------------------------------------------- initA --------------------------------------------
% initA: ∅ → array
initA() -> {array, liste:create()}.


% --------------------------------------------- lengthA --------------------------------------------
% lengthA: array → pos
lengthA({array, Array}) -> liste:laenge(Array).

% --------------------------------------------- setA --------------------------------------------
% setA: array × pos × elem → array
setA({array, Array}, Pos, Elem) -> 	Newpos = Pos + 1, 
									Arraygroeße = liste:laenge(Array), 
									if
										Newpos =< Arraygroeße ->
											Newarray = liste:delete(Array, Newpos), 
											{array, liste:insert(Newarray, Newpos, Elem)};
										Newpos > Arraygroeße ->
											Nullenauffueller = liste:insert(Array, Arraygroeße + 1, 0), 
											setA({array, Nullenauffueller}, Pos, Elem)
									end.
									
% --------------------------------------------- getA --------------------------------------------
% getA: array × pos → elem													
getA({array, Array}, Pos) -> LaengeA = lengthA({array, Array}), Pos1 = Pos + 1,
								if 
									Pos1 < 0 ->
										{array, Array};
									Pos1 > LaengeA ->
										0;
									Pos1 =< LaengeA ->	
										liste:retrieve(Array, Pos1)
								end.		
													
													
