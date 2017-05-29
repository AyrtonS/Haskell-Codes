module Aula17 where

import qualified Data.Map.Strict as Map

-- A gente nao vai ver Arrows em detalhe, mas esse operador eh muito util.
import Control.Arrow ((>>>))

import Control.Applicative

import Data.List (groupBy, sort)

import Aula15 (computeChance)

-- Antes de tudo, vamos exercitar um pouco os operadores <$> e <*>
-- Escreva uma funcao que calcula o produto cartesiano de duas listas
-- Ex: dadas [1, 2] e ['a', 'b'] como entrada, devemos retornar [(1, 'a'), (1, 'b'), (2, 'a'), (2, 'b')]

cartesian :: [a] -> [b] -> [(a, b)]
cartesian [] [] = []
cartesian zs ws = f zs ws where
		  f [] ys = []
		  f (x:xs) ys = ((,) <$> pure x <*> ys ) ++ (f xs ys)

-- Vamos continuar nossa construcao da cadeia de Markov.
-- Primeiro, vamos fazer uma pequena transformacao a partir do mapeamento
-- produzido por computeChance. Vamos usar a funcao toList, definida em
-- Data.Map.Strict, para obter uma lista do tipo [((String, String), Double)], e
-- em seguida ordená-la, para entao usar a funcao groupBy, definida em
-- Data.List, para obter uma lista do tipo [[((String, String), Double)]], onde
-- os elementos de tipo ((String, String), Double) sao agrupados pela igualdade 
-- da primeira String (vc vai precisar definir um comparador para isso).
-- Obteremos uma funcao do tipo:

--consecutivesWithChance :: Map.Map (String, String) Double -> [[((String, String), Double)]]
--consecutivesWithChance = Map.toList >>> sort >>> groupBy (.==.) where
--                             ((strA1, strA2), x) .==. ((strB1, strB2), y) = [[("sdfgh","assas"),x]]

-- Agora que nos temos uma lista do tipo [[((String, String), Double)]], vamos 
-- construir uma lista do tipo [(String, [(String, Double)])] (jah que a
-- primeira String eh igual em todos os elementos de cada lista aninhada,
-- podemos "coloca-la em evidencia"). Apos isso, usamos a lista produzida para 
-- construir um mapeamento.

-- Dica: faca uma transformacao de elementos do tipo ((x, y), z) em elementos do
-- tipo (x, (y, z)). Dada uma lista da forma [(a, (b, c))], como obteriamos uma
-- lista da forma [(b, c)]? Ainda mais, se todos os elementos do tipo a sao
-- iguais, como obteriamos uma lista na forma [(a, [(b, c)])]?

-- Vc precisarah usar 
mapConsecutivesWithChance :: [[((String, String), Double)]] -> Map.Map String [(String, Double)]
mapConsecutivesWithChance xs = Map.fromList xs' where
                               xs' = 
                               f ((x, y), z) = undefined
                               g ys = undefined

-- Usando as funcoes desenvolvidas nessa aula, podemos agora escrever a seguinte funcao

--markovChain :: String -> Map.Map String [(String, Double)]
--markovChain = undefined
