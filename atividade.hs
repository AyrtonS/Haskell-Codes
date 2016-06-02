-- Questão 1

--divisor:: Int->[Int]
--divisor n = [2..(n-1)]

--procuraPrimo :: Int->[Int]->Bool
--procuraPrimo p n = case n of
--            [] -> False
--            x:xs| mod p x == 0 -> True
--                | otherwise-> procuraPrimo xs

--primo:: Int->Bool
--primo i = not(procuraPrimo i (divisor i))

-- Questão 2

maiores :: Integer->[Integer]->[Integer]
maiores a b = case b of
        []->[]
        x:xs -> if x>a then maiores (a) (xs) ++ [x]  else maiores (a) (xs)

-- Questão 3

noFirstElement :: [a]->[a]
noFirstElement a = case a of
               []->[]
               x:xs -> xs

-- Questão 4
noLastElement :: [a]->[a]
noLastElement a = case a of
              [] -> []
              x:xs| length a<=1 -> []
                  | otherwise->noLastElement xs ++ [x]

-- Questão 6
removeElem :: Int->[Int]->[Int]
removeElem s n = case n of
            []->[]
            x:xs| x/=s -> removeElem (s) (xs) ++ [x]
                | otherwise -> removeElem s xs

-- Questões 7
intercala::[Int]->[Int]->[Int]
intercala n m =
          case (n,m) of
          ([],[])->[]
          ([],m) -> m
          (n,[]) -> n
          (x:xs,y:ys) -> [x]++[y]++intercala xs ys
