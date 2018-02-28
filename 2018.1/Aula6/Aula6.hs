module Aula6 where

import Aula3 (myIf)
import Aula2 (myCc)
-- Sabemos que as funcoes head e tail falham para listas vazias. Vamos escrever versoes seguras delas com a ajuda da monada Maybe

--data Maybe a = Nothing
--             | Just a

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:xs) = Just xs

-- Escreva uma funcao que conta quantas vezes um elemento aparece em uma lista

count :: (Eq a) => a -> [a] -> Int
count x [] = 0
count x (y:ys) = myIf(x == y) (1 + m) m where 
                 m = count x ys

-- Escreva uma função que, dado um elemento, retorna uma lista infinita desse elemento

myRepeat :: a -> [a]
myRepeat x = x : myRepeat x

-- Escreva uma função que, dada uma lista xs, cria uma lista infinita repetindo os elementos de xs

myCycle :: [a] -> [a]
myCycle [] = []
myCycle l@(x:xs) = l `myCc` myCycle l

-- Escreva uma função que recebe um elemento x e uma lista ys, 
-- retornando os elementos de ys intercalados por x.

intercalate :: a -> [a] -> [a]
intercalate x [] = []
intercalate x [y] = [y]
intercalate x (y:ys) = y : [x] `myCc` intercalate x ys
