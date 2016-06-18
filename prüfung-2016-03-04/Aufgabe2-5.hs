module Pruefung160304 where

{-
Aufgabe 2
Erstellen sie einen polymorphen algebraischen Datentyp BTree der einem Binärbaum entspricht.
Jeder Knoten enthält ein polymorphes Element und zwei Unterbäume. Ein Knoten bzw. die Unterbäume können auch leer sein.
-}

{-
Aufgabe 3
Geben Sie einen konkreten Wert für folgenden Typ in Haskell-Syntax inklusive Zeichnung an: BTree (BTree Integer, String).
Die Bäume sollen die Werte 1,2 und "ab" enthalten.
-}

{-
Aufgabe 4
Definieren Sie eine Funktion jdif die für einen BTree genau dann True liefert, wenn
für jeden Knoten gilt, dass das Element des Knotens nicht öfters als einmal in den
Unterbäumen des Knotens vorkommt. (Typklasse!)
-}

{- Aufgabe 5
Definieren Sie ftx, das eine einstellige boolsche Funktion und einen BTree erwartet und
eine Liste mit Tripeln in beliebiger Reihenfolge zurückliefert, bei denen die Funktion für
den Knoten True ist. Das erste Element des Tripels soll den Knoten enhalten,
das zweite und dritten den linken bzw. rechten Unterbaum.
Geben Sie auch hier eine möglichst allgemeine Typdeklaration für ftx an!
-}