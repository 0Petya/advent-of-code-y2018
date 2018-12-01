module Day1 (frequency1, frequency2) where

import Data.Function (fix)
import Data.Set (empty, insert, member)

parseInput :: String -> Int
parseInput ('+':xs) = read xs
parseInput ('-':xs) = negate $ read xs

frequency1 :: [String] -> Int
frequency1 xs = sum [parseInput x | x <- xs]

frequency2 :: [String] -> Int
frequency2 xs = 
    findDup $ scanl (+) 0 $ cycle [parseInput x | x <- xs]
        where findDup = fix (\f cache (y:ys) -> if member y cache then y else f (insert y cache) ys) empty
