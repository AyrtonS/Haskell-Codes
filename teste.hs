-- Questão 1 
--(VERSION 1


numInt :: Integer->String
numInt x| x==1 = "um"
        | x==2 = "DOis"
        | x==3 = "Tres"
        | x==4 = "quatro"
        | x==5 = "cinco"
        | otherwise = "O numero nao esta contido"

numInt2 :: Integer->String
numInt2 x = if (x==1) then "um" else
            if (x==2) then "dois" else
            if (x==3) then "tres" else
            if (x==4) then "quatro" else
            if (x==5) then "Cinco" else "nao existe"


-- Questao 2
--(Versao 1)
check :: Integer->String
check x | MOD x 2 == 0 = "par"
        | otherwise "impar"

check2 :: Integer->String
check2 x = if(MOD x 2 == 0) then "par" else "impar"


-- Questão 3
Fun :: Double->Double
Fun f = 5 * (f-32)/9
 
fahrenheitToCelcius :: Double->Double
fahrenheitToCelcius f = let F f

-- Questão 5

triangulo :: Double->Double->Double->Double
trangulo x y z = if(x>y+z || y>x+z || z>x+y) then False else True

-- Questão 6
Divisivel3_7 :: Integer->Boolean
Divisivel3_7 x = if(mod X 3 == 0 && mod X 7 == 0) then True else False

-- Questão 8
soma_rec :: Integer->Integer
soma_rec x = if(x==0) then 0 else x + soma_rec x-1

-- Questão 9
multnum:: Integer->Integer->Integer
multnum m n| m > n = 1
           | otherwise = m * multnum (m) (n-1)

 
