module Exercise where

import           Data.Char                      ( ord )

isLeapYear :: Int -> Bool
isLeapYear year | mod year 100 == 0 = mod year 400 == 0
                | otherwise         = mod year 4 == 0

evenList2 :: Int -> [Int] -> [Int]
evenList2 n remainingList
  | n == 0    = remainingList
  | otherwise = evenList2 (n - 1) (2 * n : remainingList)

multipleSum3Or5 :: Int -> Int -> Int
multipleSum3Or5 n total
  | n == 0                       = total
  | mod n 3 == 0 || mod n 5 == 0 = multipleSum3Or5 (n - 1) (total + n)
  | otherwise                    = multipleSum3Or5 (n - 1) total

square :: Int -> Int
square a = a ^ 2

sumOfSquare :: Int -> Int -> Int
sumOfSquare remainingCount total
  | remainingCount == 0 = total
  | otherwise = sumOfSquare (remainingCount - 1) (total + square remainingCount)

squareOfSum :: Int -> Int -> Int
squareOfSum remainingCount total
  | remainingCount == 0 = square total
  | otherwise = squareOfSum (remainingCount - 1) (total + remainingCount)

squareDifference :: Int -> Int
squareDifference n = abs (squareOfSum n 0 - sumOfSquare n 0)

fibonacci :: Int -> Int
fibonacci n | n < 1     = 0
            | n == 1    = 1
            | otherwise = fibonacci (n - 1) + fibonacci (n - 2)

memoizeFibonacci :: Int -> Int
memoizeFibonacci n | n < 1     = 0
                   | n == 1    = 1
                   | otherwise = fibs !! (n - 1) + fibs !! (n - 2)
  where fibs = map memoizeFibonacci [0 ..]

sumEvenFibonacci :: Int -> Int -> Int -> Int
sumEvenFibonacci maxValue n total
  | total + nextFibonacci > maxValue = total
  | mod currentFibonacci 2 == 0 = sumEvenFibonacci maxValue
                                                   (n + 1)
                                                   (total + currentFibonacci)
  | otherwise = sumEvenFibonacci maxValue (n + 1) total
 where
  currentFibonacci = memoizeFibonacci n
  nextFibonacci    = memoizeFibonacci n + 1

normalizeIsbn :: String -> String
normalizeIsbn = normalizeIsbnInternal ""

normalizeIsbnInternal :: String -> String -> String
normalizeIsbnInternal normalizedIsbn isbn
  | not (null isbn) && ord currentChar == 45 = normalizeIsbnInternal
    normalizedIsbn
    (tail isbn)
  | not (null isbn) = normalizeIsbnInternal (normalizedIsbn ++ [currentChar])
                                            (tail isbn)
  | otherwise = normalizedIsbn
  where currentChar = head isbn

isValidIsbn :: String -> Bool
isValidIsbn isbn | length normalizedIsbn /= 10 = False
                 | otherwise = isValidIsbnInternal normalizedIsbn 10 0
  where normalizedIsbn = normalizeIsbn isbn

isValidIsbnInternal :: String -> Int -> Int -> Bool
isValidIsbnInternal remainingString currentMultiplier total
  | currentMultiplier > 0 = isValidIsbnInternal
    (tail remainingString)
    (currentMultiplier - 1)
    (total + (currentChar * currentMultiplier))
  | otherwise = mod total 11 == 0
  where currentChar = ord (head remainingString)
