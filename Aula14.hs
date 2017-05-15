module Aula14 where

import qualified Data.Map.Strict as Map

import System.Random

-- Na aula de hoje, vamos dar alguns passos para construir uma cadeia de Markov,
-- estrutura que serve para aprender padrões (usada, por exemplo, no
-- autocompletar dos celulares).

-- Questao 1: a funcao abaixo gera um Double aleatorio 0 <= r < 1.

getRandomDouble :: IO Double
getRandomDouble = randomIO

-- Use-a para criar uma funcao que recebe um Double e retorna True sse eh
-- sorteado um numero aleatorio menor ou igual que o recebido.

chance :: Double -> IO Bool
chance probability = do r <- getRandomDouble
			if( r <= probability ) then return True else  return False

-- Questao 2: crie uma funcao que, dada uma string, retorna uma lista de pares,
-- onde cada par eh formado por uma palavra contida na string e a palavra que a
-- sucede. Como nenhuma palavra sucede a ultima, esta deve ser ignorada.
-- Ex: para a string "esta eh uma frase", a funcao deve retornar [("esta", "eh"), ("eh", "uma"), ("uma", "frase")]

consecutiveWords :: String -> [(String, String)]
consecutiveWords str = auxConsecutiveWords (words str)

auxConsecutiveWords :: [String] -> [(String,String)]
auxConsecutiveWords [x] = []
auxConsecutiveWords (x:xs) = (x,head xs) : auxConsecutiveWords xs

-- Questao 3: crie uma função que, dada uma lista de elementos quaisquer,
-- retorna um mapeamento, onde cada elemento esta associado ao seu numero
-- de ocorrencias na lista. Talvez as funcoes member, insert e adjust sejam
-- uteis.

elementsCount :: Ord a => [a] -> Map.Map a Int
elementsCount x = if(Map.member x) then Map.adjust (+1) x 1  else Map.insert x 1

-- Questao 4: use a questao anterior para contar duas coisas: o numero de
-- ocorrencias de cada palavra em uma string; o numero de vezes que uma palavra
-- eh sucedida por uma outra palavra em uma string (use a questao 2).

countWords :: String -> Map.Map String Int
countWords = undefined

countConsecutives :: String -> Map.Map (String, String) Int
countConsecutives = undefined
