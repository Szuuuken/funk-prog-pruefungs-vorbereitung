mnr = [ 1 , 2 , 3 , 4 , 5 , 6 , 7 ] {- Matrikelnummer -}
name = "Max Mustermann" {- Name -}
knz = "E 033 4711" {- Studienkennzahl -}

t1 = ("p1", (reverse . take 2 . words . \_ -> name)"!");

{- t1:: ([Char],[[Char]]) -}

t2 = ( \x y z a  -> x(z(z(z(a)))));
{- hier allgemeinsten Typ angeben -}
{- t2 ==  (a->b)->c->(a->a)->a->b -}

t3 = t2 (take 4) (\x-> x++x) reverse mnr -- :: [Integer]

t4 = [[i+2]|i<-mnr,i+2<5] ++ [[i |i<-mnr,3<i,i>4]]; -- [[Integer]]

t5 = take 4 [[j |j<-[5..i]]|i<-mnr] -- :: [[Integer]]

tls xs = xs : case xs of _:ys  -> tls ys; _-> []
t6 = ((tls.take 2) mnr, take 5[(i,j)|(i:j:_)<-tls mnr, i<j]); -- :: ([[Integer]],[(Integer,Integer)])

p (a:b:l) xs ys = p l (a:b:xs) (b:ys);
p _ xs ys = (sum ys, product xs);

t7 = ( p [mnr!!5, mnr!!6] [] [], p mnr [] []);
{- t7 :: ((Integer,Integer),(Integer,Integer))-}