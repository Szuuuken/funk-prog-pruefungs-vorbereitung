module Pruefung160114 where

{-
Aufgabe 2
Definieren Sie einen polymorphen algebraischen Datentyp BTplus zur Darstellung von binären Bäumen.
Knoten enthalten neben zwei (unabhängigen) polymorphen Elementen zwei Unterbäume. Weiters gibt es auch leere Bäume und leere Unterbäume
-}

data BTplus a b = Nil | Node a b (BTplus a b) (BTplus a b)

{-
Aufgabe 3
Geben Sie einen konkreten Wert für BTplus sowie seinen genauen Typ an, der die Werte "a" und 2 enthält und
genau zwei Knoten aufweist in Haskell-Syntax mit seinem Typ und als Zeichnung.
-}

btp3 = (Node "a" 2 (Node "b" 4 Nil Nil) Nil) -- :: BTPlus [Char] Integer

{-
Aufgabe 4
Definieren Sie requal, das für zwei BTplus-Bäume genau dann True ist, wenn beide
Bäume Knoten an den gleichen Stellen besitzen und der zweite polymorphe Eintrag jedes Knotens gleich
dem ersten Eintrag des anderen an der gleichen Stelle befindlichen Knotens ist.
Geben Sie hier eine möglichst allgemeine Deklaration an!
-}

requal :: (Eq a, Eq b) => BTplus a b -> BTplus b a -> Bool
requal (Node a1 b1 t1 t2) (Node a2 b2 t3 t4) = b2 == a1 && b1 == a2 && requal t1 t3 && requal t2 t4
requal Nil Nil = True
requal _ _ = False

{-
Aufgabe 5
Definieren Sie filterbt, das eine einstellige boolsche Funktion und zwei
BTplus erwartet und eine Liste jener ersten Einträge des ersten Baums und jener
zweiten Einträge des zweiten Baums in beliebiger Reihenfolge zurückliefert, für die
die boolsche Funktion zutrifft. Geben Sie für filterbt die entsprechende möglichst
allgemeine Typdeklaration an.
-}

filterbt :: (a->Bool) -> BTplus a b -> BTplus b a -> [a]
filterbt f (Node a b t1 t2) Nil  = [a | f a] ++ filterbt f t1 Nil ++ filterbt f t2 Nil
filterbt f Nil (Node a b t1 t2)  = [b | f b] ++ filterbt f Nil t1 ++ filterbt f Nil t2
filterbt f t1 t2 = filterbt f t1 Nil ++ filterbt f Nil t2
filterbt _ Nil Nil = []