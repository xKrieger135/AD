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

Die Funktion create erstellt einen leeren AVL-Baum der folgenderma�en aussieht :

create -> {}

Wenn man diesen leeren AVL-Baum hat kann man dort mithilfe des add Elemente einf�gen. Der folgende AVL-Baum hat dann das Aussehen:

{{}, {Element, Hoehe}, {}}

Die beiden leeren Klammern sind hierbei jeweils der LinkeUnterbaum und RechteUnterBaum.

Au�erdem wird beim einf�gen in den AVL-Baum gepr�ft, ob der AVL-Baum in Balance gebracht werden muss.

Hierzu dient unsere rotate Funktion, die sich um die vier F�lle RechtsRotation, LinksRotation, LinksRechtsRotation, RechtsLinksRotation k�mmert.


Zus�tzlich gibt es auch noch ein Delete, welches aus einem bestehenden AVL-Baum Elemente l�schen kann. 

Hierbei wird ebenfalls, wie bei dem add darauf geachtet, dass der Baum imemr wieder seine Balance bekommt.

Alle weiteren Methoden sind hilfsmethoden zur Ausf�hrung der Hauptmethoden.

Weiterhin kann man den Graphen, den man sich erstellt hat mit der Funktion toGraph(Baum) als PNG Datei darstellen lassen.

