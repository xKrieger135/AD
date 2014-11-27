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

aus der Datei quick.erl wird nur die Funktion sort(Parameter1, Parameter2) zum aufrufen verwendet.

Hierbei werden alle anderen Hilfsfunktionen intern verwendet und sind deswegen nicht relevant für den Aufruf.

Parameter1 ist beim Aufruf das zu sortierende Array. Der zweite Parameter ist für die Random Funktion zuständig.

Wird bei Parameter2 ein kleines r eingegeben soll sich der Quicksort randomisiert verhalten.

Alle anderen Eingaben bei Parameter zwei lösen die normale Version aus.