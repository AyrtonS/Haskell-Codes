module Main(main,soma) where

--import System.IO (stdout,hFlush)
import System.IO (stdout,hSetBuffering, BufferMode(NoBuffering))

main::IO()
main = soma

--soma::IO()
--soma =
--  do  putStrLn ("Digite o primeiro numero:")
--      num <- getLine
--      putStrLn ("Digite o segundo numero:")
--      nume <- getLine
--      putStrLn ("resultado"++show(read num + read nume))

soma::IO()
soma = do hSetBuffering stdout NoBuffering
      putStr "Digite o primeiro numero:"
      num <- getLine
      putStr "Digite o segundo numero:"
      nume <- getLine
      putStrLn ("resultado"++show(read num + read nume))
