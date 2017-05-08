module Main where

import System.Environment (getArgs)

import qualified CountTree as CT
import Data.Char

-- if (isAlphaNum x) then 
main :: IO ()
main = program0

-- O programa abaixo exibe a contagem das palavras de um programa.

program0 :: IO ()
program0 = do (fileName:_) <- getArgs
              fileContent <- readFile fileName
              let getWords = concat . map words . lines
              let countWords = foldl CT.count CT.empty (getWords fileContent)
              mapM_ (putStrLn . show) (CT.getAll countWords)
          

-- Questão 1: modifique-o, de forma que ele exiba as palavras em ordem de
-- ocorrência.

program1 :: IO ()
program1 = do (fileName:_) <- getArgs
              fileContent <- readFile fileName
              let getWords x = words (concat (lines fileContent))
              let countWords = foldl CT.count CT.empty (getWords fileContent)
              mapM_ (putStrLn . show) (CT.getAll countWords)



-- Questão 2: modifique-o, fazendo com que todas as palavras contenham apenas
-- minusculas, e de forma que sejam ignorados quaisquer caracteres
-- nao-alfanumericos.


program2 :: IO ()
program2 = do (fileName:_) <- getArgs
              fileContent <- readFile fileName
              let getWords = concat . map words . lines
              let countWords = foldl CT.count CT.empty (getWords fileContent)
              mapM_ (putStrLn . show) (CT.getAll countWords)

