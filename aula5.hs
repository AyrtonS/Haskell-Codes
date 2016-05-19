--Padrão em variável
fl :: Int -> Int -> Int
fl 10 x = 10 + x


-- Variável anônima, padrão em tuplas
f2 :: (Int,Int) -> Int
f2 (x,y) = y

-- Padrão  tupla retornando a  soma dos três primeiros elementos da lista
  f3::  Num a => [a] -> a
  f3 ( x : y : z : _) = x + y + z

    -- Retorna o elemento retorna a cabeça do vetor
        f3_1 ::  Num a => [a] -> a
        f3_1 ( x : y) = x

        f3_2 ::  Num a => [a] -> [a]
        f3_2 ( x : y) = y

fun :: String
fun =
      case [10,20,30,40] of
      [] -> "Lista Vazia"
      x:xs -> "cabeca: "++ show x ++ " cauda: "++ show xs


fun2 :: Integer
fun2 =
  case [10..20] of
  x:y:z:_ -> x + y + z
  _ -> 0
