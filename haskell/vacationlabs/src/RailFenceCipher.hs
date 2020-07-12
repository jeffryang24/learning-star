module RailFenceCipher where

withoutSpaces :: String -> String -> String
withoutSpaces inputString processedString
  | not (null inputString) && head inputString /= ' ' = withoutSpaces
    (tail inputString)
    (processedString ++ [head inputString])
  | not (null inputString) && head inputString == ' ' = withoutSpaces
    (tail inputString)
    processedString
  | otherwise = processedString

encodeMessage :: String -> String -> String -> String -> Int -> Int -> String
encodeMessage inputString rail1 rail2 rail3 currentRail movementDirection
  | not (null inputString) && currentRail == 1 = encodeMessage
    (tail inputString)
    (rail1 ++ [head inputString])
    rail2
    rail3
    (currentRail + 1)
    1
  | not (null inputString) && currentRail == 2 = encodeMessage
    (tail inputString)
    rail1
    (rail2 ++ [head inputString])
    rail3
    (currentRail + movementDirection)
    movementDirection
  | not (null inputString) && currentRail == 3 = encodeMessage
    (tail inputString)
    rail1
    rail2
    (rail3 ++ [head inputString])
    (currentRail - 1)
    (-1)
  | otherwise = rail1 ++ rail2 ++ rail3

