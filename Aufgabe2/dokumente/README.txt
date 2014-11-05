Um die verschiedenen Programme aufrufen zu können braucht man den Editor für Erlang OTP.

Diesen kann man sich downloaden unter folgender Adresse : http://www.erlang.org/download.html

Wenn man diesen dann hat, kann man die .erl Dateien wie folgt ausführen und benutzen.

1. Man öffnet den Editor von Erlang entweder mit dem Erlang Icon, oder man startet es aus der CMD heraus, indem man "werl"
eintippt. --> (muss man jedoch erst eingestellt haben, damit dies funktioniert).

2. Wenn der Editor sich geöffnet hat muss man dorthin, wo die zu benutzenden Erlang Dateien liegen, was wie folgt geht:
   - man benutzt den cd("C:\Users\patrick_steinhauer\test\test\test"). Befehl um den Ordner mit den Erlang Dateien 
	einzustellen.

3. Wenn Punkt zwei erfolgreich war, kann man die Datei, welche verwendet werden soll mit c(liste). compilieren.

4. Nun koennen die Funktionen der Datei aufgerufen werden, indem man schreibt z.B. liste:create().

5. GANZ wichtig am Ende des Befehls den PUNKT nicht vergessen!!
	

Zu den Skripten:

Folgende Funktionen sind implementiert:
(Aufruf jeweils durch Modulname:Funktionsname(Parameter))

Modul Zufall:

getNumZufall(N) : Gibt ein Array der Länge N mit zufälligen werten von 0-1000 zurück

getNumZufall(N,Max) : Gibt ein Array der Länge N mit zufälligen werten von 0-Max zurück

getNumAscending(N) : Gibt ein Array der Länge N zurück mit aufsteigenden Werten von 1-N

getNumDecending(N) : Gibt ein Array der Länge N zurück mit absteigenden Werten von N-1


Modul Sort:

insertionSort(Array) : Sortiert ein Array mit einem Insertionsort Algorythmus und gibt das sortierte Array zurück.

selectionSort(Array) : Sortiert ein Array mit einem Insertionsort Algorythmus und gibt das sortierte Array zurück.


Modul ctl:

log(N,Modus,Datei) : Erstellt eine Logdatei (CSV). Der Parameter Modus kann "all", "insert" oder "select" sein. 
		     Je nach auswahl werden dann die Algorythmen ausgeführt. Der Parameter N steht für die Maximale Arraygröße
		     Es wird bei N=1 begonnen und immer um ein erhöht.

time() : Hilfsfunktion zur bestimmung der vergangenen Zeit


Alle anderen Module sind nicht zur direkten Verwendung des Users bestimmt und enthalten zum Teil kopien der Algorythmen zur Messung von Zeit und Zugriffen.
Wir empfehlen die Nutzung einer IDE wie intelliJ, diese vereinfachen den Umgang mit Erlang. Alle Module müssen ggf vor der Nutzung kompiliert werden.