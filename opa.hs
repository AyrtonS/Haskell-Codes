module Main(main) where
import System.Environment (getArgs,getProgName)
import System.Exit (exitFailure)

-- getArgs :: IO[String]

main = do
  progName <- getProgName
  putStr " The program name is ...:"
  print progName
  args <- getArgs
  putStr "The arguments are..."
  print args


-------------------------------------------------------------------


main = do
  args <- getArgs
  case args og
    [input,output] ->
      do putStrLn ("Entrada: "++ input)
         putStrLn ("saida : "++ output)
    _ ->
      do progName <- getProgName
         putStrLn ("Chamada invalida do programa "++ progName)
         putStrLn ("Uso: "++progName++" <arquivo-entrada> <arquivo-saida>")
         exitFailure
