module Main where

import Day1 (frequency1, frequency2)

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
        _ -> putStrLn "Invalid day selected"
