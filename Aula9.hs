module Aula9 where

-- Escreva a funcao enumerate.

enumerate :: [a] -> [(Int, a)]
enumerate xs = zip [0..] (xs)

-- Foldr

myConcat :: [[a]] -> [a]
myConcat xs = foldr (++) [] xs

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile f = foldr(\x acc -> if f x then x : acc else []) []

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr(\x acc -> if f x == True then True else acc) False

myCycle :: [a] -> [a]
myCycle xs = ys where
                 ys = foldr (:) ys xs

-- Foldl

mySum :: (Num a) => [a] -> a
mySum xs = foldl (\acc x -> x+acc) 0 xs

myProd :: (Num a) => [a] -> a
myProd xs = foldl (\acc x -> x*acc) 1 xs

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial x = foldl (\acc x -> x*acc) 1 [1..x]

myReverse :: [a] -> [a]
myReverse xs = foldl (flip (:)) [] xs
