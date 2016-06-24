mnr = [ 1 , 2 , 3 , 4 , 5 , 6 , 7 ] {- Matrikelnummer -}
name = "Max Mustermann" {- Name -}
knz = "E 033 4711" {- Studienkennzahl -}

t1 = ("p2", unlines((:) ((head.words) name)["!"]));

t2 = ( \x y z  -> y.x.y );

t3 = t2 (take 4) (\x-> x++x) reverse mnr

t4 = [[i+2]|i<-mnr,i+2<5] ++ [[i | i<-mnr,3<i,i>4]];

t5 = take 4 [ [ j | j <- [5..i] ] | i <- mnr ]

tls xs = case xs of _:ys  -> ys:tls ys; _-> []
t6 = ((tls.take 3) mnr, take 5[(i,j)|(i:j:_)<-tls mnr, i<j]);

p (a:b:l) | a <= b = p (b:l);
p (a:l) = p l + a + p l;
p [e] = 10000;
p [] = 0;
t7 = ( (p.drop 4)mnr , p mnr);