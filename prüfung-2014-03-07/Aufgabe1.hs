module Pruefung140307 where

mnr = [0,2,0,0,3,3,1] :: [Integer]; {- Matrikelnummer -}
name = "Smith John" :: String; {- Familienname, Vorname(n) -}
knz = "999" :: String; {- Kennzahl -}

t1 = (take 2 . words . reverse . \x -> name++x)"!"

t2 = (\z -> \y -> \x -> z.y.x);
{- Allgemeinster Typ:  (c->d)->(b->c)->(a->b)->a->d -}

t3 = t2 (take 4) reverse (\x->x++[0]) mnr;

t4 = ( (drop 2 . take 4) [(i,i>2)|i<-mnr], take 3 [i|i<-mnr,i>2] );

t5 = drop 3 [[j|j<-[i..3]]|i<-mnr];

ml = (drop 3 . reverse . tail);
t6 = ( ml mnr, take 5 [(j,i)|i<- ml mnr, j<- ml mnr, j>i] );

p (a:b:l) | a <= b = p (b:l);
p (a:l) = p l + a + p l;
p [e] = 10000;
p [] = 0;
t7 = ( (p.drop 4)mnr , p mnr);