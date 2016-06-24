{- Aufgabe 2
Erstellen sie einen polymorphen algebraischen Datentyp BTree der einem Binärbaum entspricht.
Jeder Knoten enthält ein polymorphes Element und zwei Unterbäume.
Ein Knoten bzw. die Unterbäume können auch leer sein.
-}

data BTree a = Nil | Node a (BTree a) (BTree a)

{- Aufgabe3
Geben Sie einen konkreten Wert für folgenden Typ in Haskell-Syntax inklusive
Zeichnung an: ( BTree Integer, BTree String ).
Die Bäume sollen die Werte 1,2 und "ab" enthalten.
-}

btree3 = (Node 1 (Node 2 Nil Nil) Nil, Node "ab" Nil Nil)

{- Aufgabe 4
Definieren Sie eine Funktion jdif die für einen BTree genau dann True liefert, wenn
für jeden Knoten gilt, dass das Element des Knotens
nicht in den Unterbäumen des Knotens vorkommt. (Typklasse!)
-}

jdif :: (Eq a) => BTree a -> Bool
jdif t = jdif2 t []

jdif2 :: (Eq a) => BTree a -> [a] -> Bool
jdif2 Nil _ = True
jdif2 (Node a t1 t2) l
  | elem a l = False
  | otherwise = jdif2 t1 l' && jdif2 t2 l'
  where l' = l ++ [a]

{- Aufgabe 5
Definieren Sie filtert, das eine einstellige boolsche Funktion und einen BTree
erwartet und eine Liste jener Elemente in beliebiger Reihenfolge zurückliefert,
bei denen die Funktion für das Element True ist.
Geben Sie auch hier eine möglichst allgemeine Typdeklaration für filtert an!
-}

filtert :: (a->Bool) -> BTree a -> [a]
filtert _ Nil = []
filtert f (Node a t1 t2) = [a | f a] ++ filtert f t1 ++ filtert f t2