module Main where

import Data.Char  
import Data.List  
import Control.DeepSeq
import Control.Parallel
import Control.Parallel.Strategies


main :: IO ()
main = program

program :: IO ()
program = print $ interSec [1,4,77,2,44,56,1,22,4,2] [1,24,4,2]


disjoin :: [a] -> ([a], [a])
disjoin []         = ([], [])
disjoin [x]        = ([x], [])
disjoin (x1:x2:xs) = (x1:ps, x2:qs) where
                     	   (ps, qs) = disjoin xs


-- Função recebe duas listas completas, e usa disjoin para dividir a lista em duas, para que possa
-- ser usada em cada thread em rpar, a primeira parte tem x <- rpar $ compare' xs ps e a segunda 
-- y <- rpar $ compare' xs qs.
-- Usa union para unir as listas provinientes das threads e usa o sort para ordenar
interSec :: (Ord a) => [a] -> [a] -> [a]
interSec xs ys = runEval $ do let (ps,qs) = disjoin ys
                              x <- rpar $ compare' xs ps
                              y <- rpar $ compare' xs qs
                              let monta = sort (x `union` y)
                              return monta

-- Função recebe duas listas, a primeira é a lista completa e a segunda é a parte da segunda lista e intersecta elas. Dai retorna uma lista
-- dos elementos intersectados.
compare' :: (Eq a) => [a] -> [a] -> [a]
compare' [] [] = []
compare' xs [] = []
compare' [] ys = []
compare' xs ys = xs `intersect` ys
