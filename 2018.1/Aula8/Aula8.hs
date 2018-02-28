module Aula8 where

import Aula7 (myFoldr)

-- Reescreva myConcat usando foldr.

myConcat :: [[a]] -> [a] 
myConcat xs = myFoldr (++) [] xs

-- Reescreva myTakeWhile usando foldr.

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile f [] = []
myTakeWhile f (x:xs) = if (f x) then (foldr (:) [] [x]) ++ myTakeWhile f xs else [] ++ myTakeWhile f xs

-- Escreva a funcao myGroup, que recebe uma lista de elementos e retorna uma lista de listas, 
-- onde cada lista eh formada por elementos iguais e consecutivos da lista recebida.

myGroup :: Eq a => [a] -> [[a]]
myGroup [] = []
myGroup (x:xs) = [myTakeWhile (==x) xs]

-- Agora vamos generalizar myGroup, fornecendo nosso proprio comparador. Como vc definiria myGroup em termos da funcao myGroupBy?

myGroupBy :: (a -> a -> Bool) -> [a] -> [[a]]
myGroupBy = undefined

-- Deduza o que a funcao abaixo deve fazer e a escreva

myFind :: (a -> Bool) -> [a] -> Maybe a
myFind = undefined

-- Escreva as funcoes abaixo em termos de folds

myAny :: (a -> Bool) -> [a] -> Bool
myAny p (x:xs) = undefined--if(p x) then True else foldr ()

myCycle :: [a] -> [a]
myCycle l@xs = (foldl (++) l []) ++ myCycle l 
