module Main(main) where
import System.Environment (getArgs,getProgName)
-- getArgs :: IO[String]

main = do
  progName <- getProgName
  putStr " The program name is ...:"
  print progName
  args <- getArgs
  putStr "The arguments are..."
  print args
