
calc_distancia x x1 y y1 | x1 == x = abs(x1 - x) -- condição 1  
                         | y1 == y = abs(y1 - y) -- condição 2
                         | otherwise = sqrt ((x1 - x)^2 + (y1 - y)^2 )

--Questao 1

check_equality a b c | a==c && b/=c = 2
		     | a==b && b/=c = 2 
                     | a==b && b==c = 3
                     | a/=b && b/=c = 0


-- Questao 2 
check_power x | x>=0 = (x^2)^2



-- Questão 3

check_even y | mod y 2==0 = 1
             | mod y 2/=0 = 0



-- Questão 4 

check_grade z | z>=9 = 'A'
	      | z>=7.5 && z<9 = 'B'
              | z>=6 && z<7.5 = 'C'
              | z>=4 && z<6 = 'D'
              | z>=0 && z<4 = 'E'

-- Questão 5 

check_biggest x y | x>y = x
                 | y>x = y


-- Questão 6

check_biggest_2 x y z | x>y && x>z = x
                      | y>x && y>z = y
                      | z>x && z>y = z

-- Questao 7 

check_factorial x | x == 1 = 1
		| otherwise = x*(check_factorial(x-1))