--9.2: runs vig cypher 
module Main where
import System.Environment
import Data.Char
import System.Exit
import Text.Regex.Posix

charCase cas
  | isLower cas = 'a'
  | isUpper cas = 'A'
  | otherwise = cas
charNum :: Int -> Char -> Int
charNum n c = ((ord c - ord (charCase c)) + n) `mod` 26
charNums :: String -> [Int]
charNums c
  |(c !! 0) /= '-' = map (charNum 0) c
  |otherwise = map (* (-1)) (map (charNum 0) (drop 1 c))
rotCase :: Int -> Char -> Char
rotCase n c = chr (ord (charCase c) + charNum n c)
charCase:: Char -> Char
rotChar :: Int -> Char -> Char
rotChar n c
  | isAlpha c = rotCase n c
  | otherwise = c
rot :: Int -> [Char] -> [Char]
rot n = map $ rotChar n
vig :: [Char] -> [Char] -> [Char]
vig k = zipWith (rotChar) $ (cycle . charNums) k
rotStdin :: Int -> IO ()
rotStdin = interact . rot
vigStdin :: [Char] -> IO()
vigStdin = interact . vig
usage :: IO ()
usage = do
  progname <- getProgName
  putStrLn $ "usage :" ++ progname ++ " [n] "
  exitWith $ ExitFailure 255

main :: IO ()
main = do
  args <- getArgs
  case args of
   [] -> rotStdin 13
   [x]
     | x =~ "^-?[a-z]+$" -> vigStdin x
     | x =~ "^-?[0-9]+$" -> rotStdin (read x)
     | otherwise           -> usage
   _ -> usage













