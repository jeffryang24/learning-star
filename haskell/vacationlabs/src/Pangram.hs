module Pangram where

import           Data.Char                      ( toLower
                                                , isAlpha
                                                )

charPresent :: Char -> String -> Bool
charPresent needle haystack
  | not (null haystack) && toLower needle == toLower currentChar = True
  | not (null haystack) && toLower needle /= toLower currentChar = charPresent
    needle
    (tail haystack)
  | otherwise = False
  where currentChar = head haystack

isPangram :: String -> String -> Int -> Bool
isPangram remainingChars remainingString totalNotFound
  | not (null remainingChars)
    && charPresent (head remainingChars) remainingString
  = isPangram (tail remainingChars) remainingString totalNotFound
  | not (null remainingChars)
    && not (charPresent (head remainingChars) remainingString)
  = isPangram (tail remainingChars) remainingString (totalNotFound + 1)
  | otherwise
  = totalNotFound == 0
