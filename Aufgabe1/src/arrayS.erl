-module(arrayS).
-compile(export_all).

% --------------------------------------------- initA --------------------------------------------
% initA: ∅ → array
% Erstellt ein leeres Array und gibt es zurück.
initA() -> {array, liste:create()}.


% --------------------------------------------- lengthA --------------------------------------------
% lengthA: array → pos
% Gibt die Länge des Arrays zurück, indem es die Länge der Liste ausgibt.
% Notiz: Länge ist ungleich der Position des letzten Elements, da ein Array bei 0 beginnt
lengthA({array, Array}) -> liste:laenge(Array).

% --------------------------------------------- setA --------------------------------------------
% setA: array × pos × elem → array
% Setzt einen Wert an einer bestimmten Position im Array.
% Zwischenstellen werden mit Nullen aufgefüllt.
% Gibt das neue Array zurück.
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
% Gibt den Wert an einer gegebenen Position zurück.
% Ist die Position nicht vorhanden so wird eine 0 zurück gegeben.											
getA({array, Array}, Pos) -> LaengeA = lengthA({array, Array}), Pos1 = Pos + 1,
								if 
									Pos1 < 0 ->
										{array, Array};
									Pos1 > LaengeA ->
										0;
									Pos1 =< LaengeA ->	
										liste:retrieve(Array, Pos1)
								end.		
													
													
