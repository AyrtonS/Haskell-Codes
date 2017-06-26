module Aula21 where

import Control.Parallel
import Control.Parallel.Strategies

import Data.List

main :: IO ()
main = program1

-- Olar

-- Vcs se lembram da funcao map?
-- Esse eh um jeito interessante de escrever ela.

myMap :: (a -> b) -> [a] -> [b]
myMap f []     = []
myMap f (x:xs) = x':xs' where
                 x'  = f x
                 xs' = myMap f xs

-- Podemos forcar a computacao de x' da seguinte forma

myMap' :: (a -> b) -> [a] -> [b]
myMap' f []     = []
myMap' f (x:xs) = seq x' (x':xs') where
                  x'  = f x
                  xs' = myMap' f xs

sum' :: [Int] -> Int
sum' = foldl' (+) 0

-- A funcao abaixo parece ser cara de se computar.

expensive :: Int -> Int
expensive x = sum' [1..10000000] + x

-- Portanto, esse programa demoraria a executar.

program1 :: IO ()
program1 = print $ myMap' expensive [1..16]

-- XS = MYmAP (+1) [1..10] :: [Int]
-- YS = myMap (+1) [1..10] :: [Int]


--seq é apra ter uma relação entre os dados; (x':xs) depende de x'

 
-- Leia a questao 3 primeiro.

-- Questao 1
-- Qual seria uma estrategia interessante para executar o programa acima usando
-- dois nucleos? Escreva um program2 que a utilize. Calcule seu speedup.

-- Questao 2
-- Adapte a estrategia desenvolvida na questao 1 para tirar proveito de todos os
-- nucleos do seu computador. Calcule os speedups para k nucleos, onde k varia
-- de 2 ate o numero de nucleos do seu computador.

-- Questao 3
-- Vc conseguiria fazer uma versao generica de map, que paralelizasse a
-- computacao da transformacao de cada elemento? Essa seria uma resposta para
-- as questoes anteriores.
