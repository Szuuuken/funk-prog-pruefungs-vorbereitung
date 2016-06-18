module Pruefung160304 where
--- Geben Sie die Werte bzw. den allgemeinsten Typ von t1 bis t7 an.

mnr = [ 1 , 2 , 3 , 4 , 5 , 6 , 7 ] {- Matrikelnummer -}
name = "Mustermann, Max" {- Name -}
knz = "E 033 4711" {- Studienkennzahl -}

t1 = ("p1", (take 3.reverse.show) mnr, "???")

t2 = (\x y z -> y.x.y)

t3 = t2 (take 4) (\x->x++x) reverse mnr

-- t4 = ([i | i<-mnr,i>2], ???)

-- t5 = ???

-- tls xs = xs : case xs of _:ys  -> tls ys; _-> []
-- t6 = ((tls.take 3) mnr, take 5 [j | (0:j:_)<-tls mnr]);

p (a:l) = p l + a + p l;
p (a:b:l) | a <= b = p (b:l);
p [e] = 10000;
p [] = 0;

t7 = ( (p.drop 4)mnr , p mnr);