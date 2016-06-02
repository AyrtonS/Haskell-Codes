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
