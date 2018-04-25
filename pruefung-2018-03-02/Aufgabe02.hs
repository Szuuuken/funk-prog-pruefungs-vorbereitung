{- Definieren Sie einen polymorphen algebraischen Datentyp BTree zur Darstellung von binären Bäumen.
 - Knoten enthalten neben einem polymorphen Element zwei Unterbäume.
 - Weiters gibt es auch leere Bäume und leere Unterbäume. -}

data BTree a  = ElementHolder a (BTree a) (BTree a) | EmptyTree  deriving Show -- deriving show is not nceessary, but it helps when testing this.
data BTree2 a = Node a (BTree a) (BTree a) | Nil -- this is equivalent; Node and Nil are *not* predefined.

{- Geben Sie einen konkreten Wert des Typs BTree (BTree Integer, String), der die Werte 1, 2 und "ab" enthält,
 - in Haskell- Syntax und als Zeichnung an.  -}

-- schoen schrittweise

a = EmptyTree :: BTree (BTree Integer, String)
b = ((ElementHolder 1) EmptyTree EmptyTree) :: (BTree Integer)
c = ((ElementHolder 1) (ElementHolder 2 EmptyTree EmptyTree) EmptyTree) :: (BTree Integer)
d = (EmptyTree, "ab")  :: (BTree Integer, String)
e = ((ElementHolder 2 (ElementHolder 1 EmptyTree EmptyTree) EmptyTree), "ab")  :: (BTree Integer, String)

f = (ElementHolder((ElementHolder 2 (ElementHolder 1 EmptyTree EmptyTree) EmptyTree), "ab") EmptyTree EmptyTree)  :: BTree (BTree Integer, String)


{- Definieren Sie juniq, das für einen Baum des Typs BTree genau dann True ist,
 -  wenn in jedem Knoten das polymorphe Element höchstens einmal in den Unterbäumen des Knotens vorkommt.
 -  Geben Sie für juniq auch die entsprechende Typdeklaration an. (Typklasse!) -}

juniq :: Eq a => (BTree a) -> Bool
juniq EmptyTree 				= True
juniq (ElementHolder e t1 t2)
	| (count e t1) + (count e t2) > 1	= False
	| otherwise				= (juniq t1 && juniq t2)

count :: Eq a => a -> BTree a -> Integer
count _ EmptyTree = 0
count e (ElementHolder a t1 t2)
	| e == a	= 1 + (count e t1) + (count e t2)
	| otherwise	= (count e t1) + (count e t2)

c1 = EmptyTree :: (BTree Integer)
c2 = (ElementHolder 1 EmptyTree EmptyTree) :: (BTree Integer)
c3 = (ElementHolder 1 (ElementHolder 1 EmptyTree EmptyTree) EmptyTree) :: (BTree Integer)
c4 = (ElementHolder 1 (ElementHolder 1 EmptyTree EmptyTree) (ElementHolder 1 EmptyTree EmptyTree)) :: (BTree Integer)
c5 = (ElementHolder 1 (ElementHolder 2 EmptyTree EmptyTree) (ElementHolder 1 EmptyTree EmptyTree)) :: (BTree Integer)
c6 = (ElementHolder 1 (ElementHolder 2 EmptyTree EmptyTree) (ElementHolder 2 EmptyTree EmptyTree)) :: (BTree Integer)
c7 = (ElementHolder 1 (ElementHolder 2 (ElementHolder 1 EmptyTree EmptyTree) EmptyTree) (ElementHolder 2 EmptyTree (ElementHolder 1 EmptyTree EmptyTree))) :: (BTree Integer)


{- Definieren Sie trx, das zwei Argumente erwartet: Eine einstellige boolsche Funktion und einen BTree.
 - Die Funktion liefere eine Liste aus Tripeln jener Knoten zurück, für die die Funktion zutrifft (angewandt auf den gesamten Knoten).
 - Im Tripel ist das erste Element das Knotenelement, das zweite der linke und das dritte der rechte Unterbaum.
 - Die Elemente der Liste kommen in beliebiger Reihenfolge vor.
 - Geben Sie auch hier eine möglichst allgemeine Deklaration an! -}







