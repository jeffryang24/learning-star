module Throwaway where

addNumbers :: Int
addNumbers = 10 + 20

addInts :: Int -> Int -> Int
addInts x y = x + y


checkNumber :: Int -> String
checkNumber x = if mod x 2 == 0 then "even" else "odd"
