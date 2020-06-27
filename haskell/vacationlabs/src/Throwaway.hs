module Throwaway where

import           Data.Char                      ( toUpper )

addNumbers :: Int
addNumbers = 10 + 20

addInts :: Int -> Int -> Int
addInts x y = x + y


checkNumber :: Int -> String
checkNumber x = if mod x 2 == 0 then "even" else "odd"

toUpperCase :: String -> String -> String
toUpperCase processedString remainingString = if null remainingString
  then processedString
  else toUpperCase (processedString ++ [toUpper (head remainingString)])
                   (tail remainingString)

isCharPresent :: Char -> String -> Bool
isCharPresent needle remainingString =
  not (null remainingString)
    && (  (needle == head remainingString)
       || isCharPresent needle (tail remainingString)
       )

isStringPresent :: String -> String -> Bool
isStringPresent needles haystack =
  null needles
    || (  isCharPresent (head needles) haystack
       && isStringPresent (tail needles) haystack
       )
