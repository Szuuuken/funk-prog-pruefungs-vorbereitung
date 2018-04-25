mnr = tail [0,1,2,3,4,5,6,7] :: [Integer]; {-Matrikelnummer-}
name = "Mustermann, Max" :: String; {- Familienname, Vorname(n) -}
knz = "E033 534" :: String {- Kennzahl -}

t1 = ("p1", (take 2.reverse.show)mnr, (head.words.(\n o ->o:name)'-')'+');
{- ("p1","]7","+Mustermann,") -}

t2 = (\x y z -> y.x.y); {- hier nur allgemeinster Typ! -}
{- (a -> b) -> (b -> a) -> c -> b -> a -}

t3 = t2 (take 3) (\x -> x++x) reverse mnr;
{- [1,2,3,1,2,3] -}

t4 = ( [i|i<-mnr, i>3], [(i, i`mod`3)|i<-mnr] );
{- ([4,5,6,7],[(1,1),(2,2),(3,0),(4,1),(5,2),(6,0),(7,1)]) -}

t5 = [(sum([i..4]),i)|i<-(tail mnr)];
{- [(9,2),(7,3),(4,4),(0,5),(0,6),(0,7)] -}

tls xs = xs: case xs of _:ys -> tls ys; _ -> [];
t6 = ((tls.take 3)mnr, take 5[j|1:j:_<-tls mnr]);
{- ([[1,2,3],[2,3],[3],[]],[2]) -}

p (a:l) = a + p l + a + p l;
p (a:b:l) | a <= b = p (b:l);
p [e] = 200000;
p _ = 0;
t7 = ( (p.drop 4)mnr, p mnr);
{- (90,1538) -}

