Um die verschiedenen Programme aufrufen zu k�nnen braucht man den Editor f�r Erlang OTP.

Diesen kann man sich downloaden unter folgender Adresse : http://www.erlang.org/download.html

Wenn man diesen dann hat, kann man die .erl Dateien wie folgt ausf�hren und benutzen.

1. Man �ffnet den Editor von Erlang entweder mit dem Erlang Icon, oder man startet es aus der CMD heraus, indem man "werl"
eintippt. --> (muss man jedoch erst eingestellt haben, damit dies funktioniert).

2. Wenn der Editor sich ge�ffnet hat muss man dorthin, wo die zu benutzenden Erlang Dateien liegen, was wie folgt geht:
   - man benutzt den cd("C:\Users\patrick_steinhauer\test\test\test"). Befehl um den Ordner mit den Erlang Dateien 
	einzustellen.

3. Wenn Punkt zwei erfolgreich war, kann man die Datei, welche verwendet werden soll mit c(liste). compilieren.

4. Nun koennen die Funktionen der Datei aufgerufen werden, indem man schreibt z.B. liste:create().

5. GANZ wichtig am Ende des Befehls den PUNKT nicht vergessen!!
	

Zu den Skripten:

Folgende Funktionen sind implementiert:
(Aufruf jeweils durch Modulname:Funktionsname(Parameter))

Modul Zufall:

getNumZufall(N) : Gibt ein Array der L�nge N mit zuf�lligen werten von 0-1000 zur�ck

getNumZufall(N,Max) : Gibt ein Array der L�nge N mit zuf�lligen werten von 0-Max zur�ck

getNumAscending(N) : Gibt ein Array der L�nge N zur�ck mit aufsteigenden Werten von 1-N

getNumDecending(N) : Gibt ein Array der L�nge N zur�ck mit absteigenden Werten von N-1


Modul Sort:

insertionSort(Array) : Sortiert ein Array mit einem Insertionsort Algorythmus und gibt das sortierte Array zur�ck.

selectionSort(Array) : Sortiert ein Array mit einem Insertionsort Algorythmus und gibt das sortierte Array zur�ck.


Modul ctl:

log(N,Modus,Datei) : Erstellt eine Logdatei (CSV). Der Parameter Modus kann "all", "insert" oder "select" sein. 
		     Je nach auswahl werden dann die Algorythmen ausgef�hrt. Der Parameter N steht f�r die Maximale Arraygr��e
		     Es wird bei N=1 begonnen und immer um ein erh�ht.

time() : Hilfsfunktion zur bestimmung der vergangenen Zeit


Alle anderen Module sind nicht zur direkten Verwendung des Users bestimmt und enthalten zum Teil kopien der Algorythmen zur Messung von Zeit und Zugriffen.
Wir empfehlen die Nutzung einer IDE wie intelliJ, diese vereinfachen den Umgang mit Erlang. Alle Module m�ssen ggf vor der Nutzung kompiliert werden.