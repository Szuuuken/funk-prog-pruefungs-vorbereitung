{- Aufgabe 2
Erstellen sie einen polymorphen algebraischen Datentyp TTree der einem ternären Baum entspricht.
Jedes Blatt enthält genau ein polymorphes Element. Jeder Knoten enthält genau drei Unterbäume.
Ein Knoten, Blatt bzw. die Unterbäume können auch leer sein.
-}

data TTree a = Nil | Leaf a | Node (TTree a) (TTree a) (TTree a) deriving Show

{- Aufgabe 3
Geben Sie einen konkreten Wert für folgenden Typ in Haskell-Syntax inklusive
Zeichnung an: (TTree (TTree Integer)). Die Bäume sollen die Werte 1 und 2 enthalten.
-}

ttree3 = Leaf (Node (Leaf 1) (Leaf 2) Nil)

{- Aufgabe 4
Definieren Sie eine Funktion geordnet die für einen TTree genau dann True liefert, wenn:
1) Das Element vom ersten Unterbaum < das Element vom zweiten Unterbaum ist
2) Das Element vom zweiten Unterbaum < das Element vom dritten Unterbaum ist
-}

geordnet :: (Ord a) => TTree a -> Bool
geordnet (Node (Leaf a) (Leaf b) (Leaf c)) = a < b && b < c
geordnet (Node n1 n2 n3) = geordnet n1 && geordnet n2 && geordnet n3
geordnet _ = False

{- Aufgabe 5
Definieren Sie die Methode zipT , die zwei TTree vergleicht, und einen TTree zurückgibt, der genau
an der Stelle einen Knoten hat, wo die zwei übergebenen TTree einen Knoten
haben, und genau dort ein Blatt hat, wo die zwei übergebenen TTree
ein Blatt haben. Der Wert im Blatt des neuen Blattes ist ein Paar
aus den Werten der Blätter der übergebenen TTrees.
Überall anders soll ein leeres Element stehen.
-}

zipT :: TTree a -> TTree a -> TTree (a,a)
zipT (Leaf a) (Leaf b) = Leaf (a,b)
zipT (Node a1 b1 c1) (Node a2 b2 c2) = (Node (zipT a1 a2) (zipT b1 b2) (zipT c1 c2))
zipT _ _ = Nil