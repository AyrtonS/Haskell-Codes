module Aula2 where

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)


myLength :: [a] -> Int
myLength [] = 0
myLength (x : xs) = 1 + myLength xs

myNull :: [a] -> Bool
myNull [] = True
myNull (x : xs) = False

myHead :: [a] -> a
myHead [] = error "A lista não tem cabeça"
myHead (x : xs) = x

myTail :: [a] -> [a]
myTail [] = error "Lista vazia não tem calda"
myTail (x : xs) = xs

myLast :: [a] -> a
myLast [] = error "Lista vazia não tem um ultimo elemento"
myLast [x] = x
myLast (x : xs) = myLast xs 

myInit :: [a] -> [a]
myInit [] = error "Impossivel, lista n existe"
myInit (x : []) = []
myInit (x : xs) = x : myInit xs

myCC :: [a] -> [a] -> [a]
myCC [] ys = ys
myCC (x : xs) ys = x : myCC xs ys

myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat (xs : xss) = myCC xs (myConcat xss)

myReverse :: [a] -> [a]
myReverse [] = []
myReverse xs =  auxiliar xs [] where 
                auxiliar [] ys = ys
                auxiliar (x : xs) ys = auxiliar xs (x : ys)

myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (False : _) = False
myAnd (True : xs) = myAnd xs

myOr :: [Bool] -> Bool
myOr [] = False
myOr (True : _) = True
myOr (False : xs) = myOr xs