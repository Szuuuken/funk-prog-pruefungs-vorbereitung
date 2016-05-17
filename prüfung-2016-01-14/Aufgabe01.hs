--- https://vowi.fsinf.at/wiki/TU_Wien:Funktionale_Programmierung_VU_(Knoop)/Pr%C3%BCfung_2016-01-14#Aufgabe_1
--- Geben Sie die Werte und den allgemeinsten Typ von t1 bis t7 an.

module Pruefung160114 where

mnr = [ 1 , 2 , 3 , 4 , 5 , 6 , 7 ] {- Matrikelnummer -}
name = "Mustermann Max"             {- Name -}
knz = "E 033 534"                   {- Studienkennzahl -}

t1 = ["p1", (drop 9.show) mnr, (head.words.(let no n = name; in no))"No"]

t2 = (\x y z a -> ((x.y)z, (y.x)z));

t3 = t2 reverse (take 3) mnr (drop 3)

t4 = ((drop 4) [[i-2] | i <- mnr], [i | i <- mnr, i > 3])

t5 = take 4 [[i | j<- [i..5]] | i <- mnr]

ml _ = (tail.tail.reverse.tail)
t6 = (ml 2 mnr, take 5 [(i,j) | i <- ml 2 mnr, j <- ml 2 mnr, j >= i])

p o (a:l) (b:m) n = o a b : p o l m n
p o _ _ n = n
t7 = p (+) (reverse mnr) mnr [11]