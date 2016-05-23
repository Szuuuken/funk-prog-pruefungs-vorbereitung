--- https://vowi.fsinf.at/wiki/TU_Wien:Funktionale_Programmierung_VU_(Knoop)/Pr%C3%BCfung_2016-01-14#Aufgabe_1
--- Geben Sie die Werte und den allgemeinsten Typ von t1 bis t7 an.

module Pruefung160114 where

mnr = [ 1 , 2 , 3 , 4 , 5 , 6 , 7 ] {- Matrikelnummer -}
name = "Mustermann Max"             {- Name -}
knz = "E 033 534"                   {- Studienkennzahl -}

t1 = ["p1", (drop 9.show) mnr, (head.words.(let no n = name; in no))"No"]

t2 = (\x y z a -> ((x.y)z, (y.x)z));
{-  (a -> a) -> (a -> a) -> a -> b -> (a,a) -}

t3 = t2 reverse (take 3) mnr (drop 3)
{- ([3,2,1],[7,6,5]) -}

t4 = ((drop 4) [[i-2] | i <- mnr], [i | i <- mnr, i > 3])
{- [[3],[4],[5]],[4,5,6,7]) -}

t5 = take 4 [[i | j<- [i..5]] | i <- mnr]
{- [[1,1,1,1,1],[2,2,2,2],[3,3,3],[4,4]] -}

ml _ = (tail.tail.reverse.tail)
t6 = (ml 2 mnr, take 5 [(i,j) | i <- ml 2 mnr, j <- ml 2 mnr, j >= i])
{- ([5,4,3,2],[(5,5),(4,5),(4,4),(3,5),(3,4)]) -}
p o (a:l) (b:m) n = o a b : p o l m n
p o _ _ n = n
t7 = p (+) (reverse mnr) mnr [11]

{- [8,8,8,8,8,8,8,11] -}
