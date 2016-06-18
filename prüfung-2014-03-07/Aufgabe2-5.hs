module Pruefung140307 where

-- Aufgabe 2
-- 5% Definieren Sie einen polymorphen algebraischen Datentyp TTree zur Darstellung von ternären Bäumen.
-- Knoten enthalten drei unabhängige polymorphe Elemente und drei Unterbäume. Es gibt auch leere Bäume und Unterbäume.

data TTree a b c = Nil | Node a b c (TTree a b c) (TTree a b c) (TTree a b c)

-- Aufgabe 3
-- 5% Geben Sie einen konkreten TTree-Baum in Haskell-Syntax mit seinem genauen
-- Typ und als Zeichnung an, der die Werte "a" und 2 sowie einen TTree-Baum als Element enthält.

tree3  = Node 2 "b" 3 (Node 1 "a" 4 Nil Nil Nil) Nil Nil
-- :t tree :: TTree Integer [Char] Integer

-- Aufgabe 4
-- 5+15%
-- Definieren Sie rrt, das für einen TTree-Baum genau dann True ist, wenn

-- 1. alle ersten Elemente aller Knoten des rtt-Baums, wiederum einen TTree-Baum genannt Elementbaum enthalten, sowie
-- 2. alle Elementbäume Knoten und leere Unterbäume aufweisen, und
-- 3. das zweite und dritte Element aller Elementbäume gleich dem entsprechenden dritten und zweiten Element des rtt-Baums ist.

-- Geben Sie hier auch eine möglichst allgemeine Typdeklaration für rtt an!

rrt :: (Eq b , Eq c) => TTree (TTree a b c) b c -> Bool
rrt (Node (Node _ b' c' Nil Nil Nil) b c n1 n2 n3) = (b' == b) && (c' == c) && (rrt n1) && (rrt n2) && (rrt n3)
rrt Nil = True
rrt _ = False

-- Aufgabe 5

-- 5+15%
-- Definieren Sie filtertt, das eine zweistellige boolsche Funktion und einen TTree erwartet und
-- eine Liste jener Knoten in beliebiger Reihenfolge zurückliefert, bei denen die Funktion für den ersten und zweiten Eintrag True ist.

-- Geben Sie auch hier eine möglichst allgemeine Typdeklaration für filtertt an!

filtertt :: (a -> b -> Bool) -> TTree a b c -> [ TTree a b c]
filtertt f n@(Node a b c n1 n2 n3) = [n | f a b] ++ filtertt f n1  ++ filtertt f n2 ++ filtertt f n3
filtertt _ _ = []