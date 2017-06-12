module Aula19 where

import Control.Applicative
import Control.Monad

-- Questao 1
-- A funcao abaixo deve ser equivalente a (<$>), mas restrita a Applicative.
-- Escreva-a usando pure e <*>.

(.<$>.) :: Applicative f => (a -> b) -> f a -> f b
f .<$>. x = f <*> pure x

data MyMaybe a = Some a | None

-- Questao 2
-- Faca MyMaybe uma instancia de Functor.

-- Questao 3
-- Faca MyMaybe uma instancia de Applicative.

-- Questao 4
-- Faca MyMaybe uma instancia de Alternative.

-- Questao 5
-- Faca MyMaybe uma instancia de Monad.
-- (Apesar de nos termos aprendido sobre =<<, a definicao de uma monada envolve
-- o operador (>>=) = filp (=<<))

-- Questao 6
-- Agora que vc definiu MyMaybe como uma monada, experimente a funcao join.
-- Em nenhum momento nos definimos join diretamente, o que nos leva a crer que
-- join pode ser definida em termos de (>>=). Defina myJoin, que deve ser
-- equivalente a join.

myJoin :: Monad m => m (m a) -> m a
myJoin = undefined
