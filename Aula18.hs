module Aula18 where

import Control.Applicative
-- Questao 1
-- Dada uma lista, retorne a lista de todas as suas subsequencias.

subsequences :: [a] -> [[a]]
subsequences []     = []
--subsequences (x:xs) = [x] : (xs : subsequences xs)
subsequences (x:xs) = [x] : xs : ([x] ++ xs) : subsequences xs
-- Questao 2x
-- A funcao abaixo eh uma tentativa de escrever partition usando a notacao do.
-- Essa tentativa falha miseravelmente, no entanto. Entenda o que ela estah
-- fazendo e procure usa-la para escrever uma funcao equivalente a partition.
-- Apesar de vc conseguir consertar a funcao, a notacao do eh a melhor escolha?
-- Vc pode precisar das fumcoes concat e unzip.

myPartition p xs = do x <- xs
                      if (p x)
                      then return ([x], [])
                      else return ([], [x])

-- Observe que a geente pode omitir a assinatura de uma funcao, apesar disso nao
-- ser recomendado.

myPartition2 = undefined

-- Coelhos!
data Rabbit = MaleRabbit
            | FemaleRabbit
            | KillerRabbit -- esse ultimo ate aparece num filme

-- Questao 3

-- Esses coelhos sao um pouco estranhos.
-- A grande festa dos coelhos comecou! Dada uma populacao inicial de coelhos,
-- devemos computar certos dados sobre eles, mas soh apos a festa.

-- Como funciona a festa: dividimos a populacao inicial de coelhos em dois
-- grupos de mesmo tamanho. Cada coelho do primeiro grupo tem um encontro com um
-- coelho do segundo grupo (dizemos que o coelho do primeiro grupo tomou a
-- iniciativa).

-- Durante o encontro entre dois coelhos, certas coisas podem ocorrer:
-- - se um coelho macho toma a iniciativa com um coelho macho, o encontro produz
--   tres coelhos machos.
-- - se um coelho femea toma a iniciativa com um coelho femea, o encontro produz
--   tres coelhos femeas.
-- - se um coelho macho toma a iniciativa com um coelho femea, o encontro produz
--   dois coelhos machos e um coelho femea
-- - se um coelho femea toma a iniciativa com um coelho macho, o encontro produz
--   dois coelhos femeas e um coelho macho
-- - um encontro entre dois coelhos assassinos produz nenhum coelho
-- - se um coelho assassino toma a iniciativa com outro coelho, o encontro
--   produz um coelho assassino.
-- - se um coelho nao-assassino toma a iniciativa com um coelho assassino, o
--   encontro produz dois coelhos assassinos.

-- Escreva as funcoes

meeting :: Rabbit -> Rabbit -> [Rabbit]
meeting = undefined

party :: [Rabbit] -> [Rabbit]
party rabbits = party' (divide rabbits) where
                party' = undefined
                divide = undefined

-- A festa acaba quando eh passada uma populacao de zero coelhos
loopParty :: [Rabbit] -> [[Rabbit]]
loopParty = undefined

-- Teste um pouco as funcoes acima com diferentes populacoes de coelhos.
-- Responda, em forma de comentario: a lista produzida por loopParty eh finita
-- ou infinita?
