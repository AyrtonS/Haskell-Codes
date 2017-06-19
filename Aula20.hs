module Aula20 where

import Data.List as L

-- As respostas dessa lista de exercicios devem ser entregues em um arquivo
-- Main.hs separado. A questao X deve se chamar programX. Para testar uma
-- questao, ela deve ser posta como main.

-- Questao 1
-- A funcao abaixo computa a soma dos elementos de uma lista.

mySum :: [Int] -> Int
mySum []     = 0
mySum (x:xs) = x + mySum xs

-- Implemente uma funcao mySum', usando foldl'
mySum' :: [Int] -> Int
mySum' = L.foldl' (+) 0
--foldl' (f) e [x:xs]
-- Agora, veja a seguinte funcao:

disjoin :: [a] -> ([a], [a],[a],[a])
disjoin []         = ([], [],[],[])
disjoin [x]        = ([x], [],[],[])
disjoin (x1:x2:x3:x4:xs) = (x1:ps, x2:qs,x3:ws,x4:vs) where
                     	   (ps, qs, ws, vs) = disjoin xs

-- Seria possível utilizar a funcao disjoin para, usando rpar, rseq e runEval,
-- criar uma funcao mySum2 que computa a soma de uma lista em paralelo, usando
-- dois núcleos? Ao escrever a funcao, vc pode computar a soma das sublistas
-- usando sum.

-- Compile Main.hs, com main = program1, com o seguinte comando:
-- ghc -O2 -threaded --make Main.hs

-- Isso vai gerar um executavel Main. Rode Main com os parâmetros:
-- time ./Main +RTS -N1 (usando um nucleo)
-- time ./Main +RTS -N2 (usando dois nucleos)

-- Dados os tempos computados acima, qual o speedup obtido?

-- Questao 2

-- Descubra quantos nucleos o seu processador tem.
-- Use o comando lscpu
-- Refaça a Questao 1, mas adapte disjoin para que vc possa distribuir trabalho
-- para todos os seus nucleos.
