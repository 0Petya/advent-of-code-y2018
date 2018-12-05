module Day2 (checksum, offByOne) where

import Control.Arrow ((***))
import Data.Foldable (foldMap)
import Data.Maybe
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

offByOne :: [String] -> String
offByOne xs = uncurry intersectInPlace . snd . head . filter ((==) 1 . fst) . concat $ [compare x xs | x <- xs]
    where
        intersectInPlace = (.) catMaybes . zipWith (\a b -> if a == b then Just a else Nothing)
        compare x (y:ys) = (diff x y, (x, y)) : if null ys then [] else compare x ys
            where diff = (.) (length . filter id) . zipWith (/=)
