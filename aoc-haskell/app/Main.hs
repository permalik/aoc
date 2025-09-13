module Main where

import System.IO (readFile)

one :: IO ()
one = do
    contents <- readFile "/home/parallels/Docs/Git/aoc/aoc-haskell/aoc/2015/001/input.txt"
    let chars = filter (/= '\n') contents
        flr   = foldl updateFloor 0 chars
    putStrLn $ "Santa is on floor: " ++ show flr ++ "\n"
  where
    updateFloor acc '(' = acc + 1
    updateFloor acc ')' = acc - 1
    updateFloor acc _ = error "Invalid floor counter"

two :: IO ()
two = do
    contents <- readFile "/home/parallels/Docs/Git/aoc/aoc-haskell/aoc/2015/001/input.txt"
    let chars = filter (/= '\n') contents
    findBasement chars 0 0
  where
    findBasement [] _ _ = putStrLn "Failed to reach basement"
    findBasement (c:cs) flr pos
      | flr == -1 = putStrLn $ "Santa is on basement floor " ++ show flr ++ " at position " ++ show pos ++ "\n"
      | otherwise =
        let flr' = case c of
                          '(' -> flr + 1
                          ')' -> flr - 1
                          _ -> error "Invalid floor counter"
        in findBasement cs flr' (pos + 1)

main :: IO ()
main = do
  putStrLn "Started one.."
  one
  putStrLn "Started two.."
  two
