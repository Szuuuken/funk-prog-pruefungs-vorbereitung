mnr = [1,2,3,4,5,6,7] :: [Integer]; {-Matrikelnummer-}
name = "Mustermann, Max" :: String; {- Familienname, Vorname(n) -}
knz = "E033 534" :: String {- Kennzahl -}

t1 = ("p1", (take 2.reverse.show)mnr, (head.words.(\n o ->o:name)'-')'+');

t2 = (\x y z -> y.x.y); {- hier nur allgemeinster Typ! -}
t21 = (\x y z -> y);
t22 = (\x y z -> y.x);
t23 = (\x y z -> x.y);
t24 = (\x y z -> x);

t3 = t2 (take 3) (\x -> x++x) reverse mnr;

t4 = ( [i|i<-mnr, i>2], [(i, i`mod`3)|i<-mnr] );

t5 = [(sum([i..5]),i)|i<-(tail mnr)];

tls xs = case xs of _:ys -> tls ys; _ -> [];

t6 = ((tls.take 3)mnr, take 5[j|0:j:_<-tls mnr]);

p (a:l) = p l + a + p l;
p (a:b:l) | a <= b = p (b:l);
p [e] = 200000;
p _ = 0;
t7 = ( (p.drop 4)mnr, p mnr);

t8 :: [Integer] -> Integer
t8 n=case n of 	[] -> 0
		[x] -> 1
		[x,y] -> 2
		(_) -> 100

p2 (a:x) = 1
p2 (a:x:y) = 2
