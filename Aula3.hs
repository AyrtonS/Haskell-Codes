module Aula3 where

myIf :: Bool -> a -> a -> a
myIf True x y = x
myIf False x y = y

myTake :: Int -> [a] -> [a]
myTake n [] = []
myTake n (x:xs) = myIf (n <= 0) ([])
                                (x : myTake (n - 1) xs)

myDrop :: Int -> [a] -> [a]
myDrop n [] = []
myDrop n xs = myIf (n <= 0) (xs)
                            (myDrop (n - 1) (tail xs))

mySplitAt :: Int -> [a] -> ([a], [a])
mySplitAt n xs = (myTake n xs, myDrop n xs)

myAnd :: Bool -> Bool -> Bool
myAnd True x = x
myAnd False x = False

myOr :: Bool -> Bool -> Bool
myOr False x = x
myOr True x = True

myIsPrefixOf :: (Eq a) => [a] -> [a] -> Bool
myIsPrefixOf [] ys = True
myIsPrefixOf xs [] = False
myIsPrefixOf (x:xs) (y:ys) = (x == y) `myAnd` (myIsPrefixOf xs ys)
