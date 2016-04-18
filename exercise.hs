-- Questão 1

salary :: Double -> Double
salary x = x +  x*(10/100) - x*(7/100);

-- Questão 2

    -- 58 /= 58 ( TRUE )
    -- abs == negate ( FALSE ) absolute /= negate
    -- False < True ( False /= True )
    -- "elefante" > "elegante" (False) por que f < g
    -- min 'b' 'h'  (resposta b)
    -- max "amaral" "ana" ( resposta  "amaral") 
    -- dobro x = x*2 ( True )
    -- nota = nota >= 6 (False, não é condição) 

-- Questão 3 

max3 :: Double -> Double -> Double -> Double
max3 x y z = if x>y && x>z then x else
	    		      if y<x && y<z then y else z 

-- Questão 4 

calc_im :: Double -> String
calc_im imc | imc <= 18.5 = "abaixo do peso, va comer pao"
	   | imc <= 25.0 = "peso normal"
               	   | imc <= 30.0 = "sobrepeso, olha olha"
	   | otherwise = "obesidade, te cuida"