module Exercise where

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
