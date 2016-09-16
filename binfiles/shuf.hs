import System.Random
--returns one of the input lines randomly
main :: IO()
main = do
  strings <- fmap lines getContents
  string <- randomRIO (0,length(strings) -1) >>= return .(strings !!)
  putStrLn $ id string
  
