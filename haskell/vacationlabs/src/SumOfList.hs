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

evenList :: Int -> [Int] -> [Int]
evenList n lst | n == 0       = lst
               | mod n 2 == 0 = evenList (n - 1) (n : lst)
               | otherwise    = evenList (n - 1) lst
