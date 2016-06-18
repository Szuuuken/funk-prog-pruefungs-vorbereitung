module Pruefung160304 where

{-
Aufgabe 2
Erstellen sie einen polymorphen algebraischen Datentyp BTree der einem Binärbaum entspricht.
Jeder Knoten enthält ein polymorphes Element und zwei Unterbäume. Ein Knoten bzw. die Unterbäume können auch leer sein.
-}

data BTree a = Nil | Node a (BTree a) (BTree a)

{-
Aufgabe 3
Geben Sie einen konkreten Wert für folgenden Typ in Haskell-Syntax inklusive Zeichnung an: BTree (BTree Integer, String).
Die Bäume sollen die Werte 1,2 und "ab" enthalten.
-}

btree3 = Node ((Node 2 (Node 1 Nil Nil) Nil),"ab") Nil Nil

{-
Aufgabe 4
Definieren Sie eine Funktion jdif die für einen BTree genau dann True liefert, wenn
für jeden Knoten gilt, dass das Element des Knotens nicht öfters als einmal in den
Unterbäumen des Knotens vorkommt. (Typklasse!)
-}

jdif :: (Eq a) => BTree a -> Bool -- (Eq a) wird benötigt damit elem funktioniert
jdif btree = jdif2 btree []

jdif2 :: (Eq a) => BTree a -> [a] -> Bool
jdif2 Nil _ = True
jdif2 (Node a t1 t2) l
  | elem a l = False
  | otherwise = jdif2 t1 l2 && jdif2 t2 l2
  where l2 = l ++ [a]

{- Aufgabe 5
Definieren Sie ftx, das eine einstellige boolsche Funktion und einen BTree erwartet und
eine Liste mit Tripeln in beliebiger Reihenfolge zurückliefert, bei denen die Funktion für
den Knoten True ist. Das erste Element des Tripels soll den Knoten enhalten,
das zweite und dritten den linken bzw. rechten Unterbaum.
Geben Sie auch hier eine möglichst allgemeine Typdeklaration für ftx an!
-}

ftx :: (a -> Bool) -> BTree a -> [(BTree a, BTree a, BTree a)]
ftx _ Nil = []
ftx f n@(Node a t1 t2) = [(n,t1,t2) | f a] ++ ftx f t1 ++ ftx f t2

