module SumOfList where

sumOfListInternal :: Int -> [Int] -> Int
sumOfListInternal total lst =
  if null lst then total else sumOfListInternal (total + head lst) (tail lst)

sumList :: [Int] -> Int
sumList = sumOfListInternal 0


sumOfEven :: Int -> [Int] -> Int
sumOfEven total lst
  | null lst              = total
  | mod (head lst) 2 == 0 = sumOfEven (total + head lst) (tail lst)
  | otherwise             = sumOfEven total (tail lst)

doubleList :: [Int] -> [Int] -> [Int]
doubleList processedList remainingList = if null remainingList
  then processedList
  else doubleList (processedList ++ [head remainingList * 2])
                  (tail remainingList)
