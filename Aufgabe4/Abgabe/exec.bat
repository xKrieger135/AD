@echo off
echo Verschiebe
move /y test.dot bin/test.dot
echo erstelle Graph
cd bin
dot -Tpng test.dot > test.png

echo Ausgabe
test.png

exit