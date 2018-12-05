module Main where

import Day1 (frequency1, frequency2)
import Day2 (checksum, offByOne)

main :: IO ()
main = do
    putStrLn "Which day to run?"
    x <- getLine
    case x of
        "1-1" -> do
            contents <- readFile "input/day1.txt"
            putStrLn . show . frequency1 . lines $ contents
        "1-2" -> do
            contents <- readFile "input/day1.txt"
            putStrLn . show . frequency2 . lines $ contents
        "2-1" -> do
            contents <- readFile "input/day2.txt"
            putStrLn . show . checksum . lines $ contents
        "2-2" -> do
            contents <- readFile "input/day2.txt"
            putStrLn . show . offByOne . lines $ contents
        _ -> putStrLn "Invalid day selected"
