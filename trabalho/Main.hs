module Main where

import Data.Char  
import Data.List  
import Control.DeepSeq
import Control.Parallel
import Control.Parallel.Strategies


main :: IO ()
main = program

program :: IO ()
program = print $ interSec2 [1,3,5,2,6,2,8,9,13,11,87,35,9,3] [1,5,2,6,90,321,5,6,78]


-- Função recebe duas listas completas, e usa disjoin para dividir a lista em duas, para que possa
-- ser usada em cada thread em rpar, a primeira parte tem x <- rpar $ compare' xs ps e a segunda 
-- y <- rpar $ compare' xs qs.
-- Usa union para unir as listas provinientes das threads e usa o sort para ordenar

-- DUAL CORE
interSec :: (Ord a) => [a] -> [a] -> [a]
interSec [] [] = []
interSec xs [] = xs
interSec [] ys = ys
interSec xs ys = runEval $ do let (ps,qs) = disjoin ys
                              x <- rpar $ compare' xs ps
                              y <- rpar $ compare' xs qs
                              let monta = x ++ y--sort (x `union` y)
                              return monta

-- DUAL CORE
disjoin :: [a] -> ([a], [a])
disjoin []         = ([], [])
disjoin [x]        = ([x], [])
disjoin (x1:x2:xs) = (x1:ps, x2:qs) where
                     	   (ps, qs) = disjoin xs



-- CORE i5, i7
interSec2 :: (Ord a) => [a] -> [a] -> [a]
interSec2 [] [] = []
interSec2 xs [] = xs
interSec2 [] ys = ys
interSec2 xs ys = runEval $ do let (ps,qs,vs,ws) = disjoin' ys
                               x <- rpar $ compare' xs ps
                               y <- rpar $ compare' xs qs
			       v <- rpar $ compare' xs vs
			       w <- rpar $ compare' xs ws
                               let monta = x ++ y ++ v ++ w --sort (x `union` y)
                               return monta

-- CORE i5, i7
disjoin' :: [a] -> ([a], [a],[a],[a])
disjoin' []                  = ([], [],[],[])
disjoin' [x]                 = ([x], [],[],[])
disjoin' (x1:x2:[])             = ([x1],[x2],[],[])
disjoin' (x1:x2:x3:[])       = ([x1],[x2],[x3],[])
disjoin' (x1:x2:x3:x4:xs)    = (x1:ps,x2:qs,x3:ws,x4:vs) where
                     	              (ps, qs, ws, vs) = disjoin' xs

-- Função recebe duas listas, a primeira é a lista completa e a segunda é a parte da segunda lista e intersecta elas. Dai retorna uma lista
-- dos elementos intersectados.
compare' :: (Eq a) => [a] -> [a] -> [a]
compare' [] [] = []
compare' xs [] = []
compare' [] ys = []
compare' xs ys = xs `intersect` ys
