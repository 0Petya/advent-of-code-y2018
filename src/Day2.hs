module Day2 (checksum) where

import Control.Arrow ((***))
import Data.Foldable (foldMap)
import Data.Monoid (Sum(..))

findDuplicateCount :: Int -> String -> Bool
findDuplicateCount n xs =
    not . null $ filter (== n) [length $ filter (== x) xs | x <- xs]

checksum :: [String] -> Int
checksum =
    getSum
    . uncurry (*)
    . foldMap (\(a, b) -> (Sum a, Sum b))
    . map (parseBool *** parseBool)
    . map (\x -> (findDuplicateCount 2 x, findDuplicateCount 3 x))
    where parseBool x = if x then 1 else 0
