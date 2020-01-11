mnr = tail [0,1,2,3,4,5,6,7] :: [Integer] {- Matrikelnummer -}
name = "Mustermann Max" :: String {- Name -}

t1 = ("p1", (drop 9.show)mnr, (take 3.zip name.tail)name)

t2 = (\a b c d -> ( (b.a)d, (a.b)d )) {- Nur allgemeinster Typ -}

t3 = t2 (take 3) reverse (drop 3) mnr

t4 = (drop 4 [[i-1] | i<-mnr], take 3 [i | i<-mnr, i>4])

t5 = take 4 [[i|j<-[i..5]] | i<-mnr]

tls _ = (tail.reverse.tail.tail)
t6 = (tls 1 mnr, take 5 [(i,j)| i <- tls 2 mnr, j <- tls 3 mnr, j<i])

p o (b:m) (a:l) n = o a b : p o l m n
p _ _ _ n = n

t7 = p (+) (reverse mnr) mnr [12]
