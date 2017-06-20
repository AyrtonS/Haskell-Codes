module Main where

import Aula20

import Control.DeepSeq

import Control.Parallel
import Control.Parallel.Strategies

main :: IO ()
main = program1

-- Questao 1

program1 :: IO ()
--program1 = print $ mySum2 [1..100000000]
program1 = print $ mySum3 [1..100000000]

-- Use mySum' para definir cada uma das somas.
mySum2 :: [Int] -> Int
mySum2 xs = runEval $ do let (ps,qs) = disjoin xs
			 x <- rpar $ mySum' ps 
			 y <- rpar $ mySum' qs
			 let soma = x+y
			 return soma

-- Questao 2

program2 :: IO ()
program2 = print $ mySum3 [1..10000000]

mySum3 :: [Int] -> Int
mySum3 xs = runEval $ do let (ps,qs,ws,vs) = disjoin2 xs
			 x <- rpar $ mySum' ps 
			 y <- rpar $ mySum' qs
 			 w <- rpar $ mySum' ws 
			 v <- rpar $ mySum' vs
			 let soma = x+y+w+v
			 return soma

disjoin2 :: [a] -> ([a], [a],[a],[a])
disjoin2 []         = ([], [],[],[])
disjoin2 [x]        = ([x], [],[],[])
disjoin2 (x1:x2:x3:x4:xs) = (x1:ps, x2:qs,x3:ws,x4:vs) where
                     	   (ps, qs, ws, vs) = disjoin2 xs

