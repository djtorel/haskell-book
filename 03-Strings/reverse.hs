-- reverse.hs
module Reverse where

rvrs :: String -> String
rvrs c = drop 9 c ++ " " ++ take 2 (drop 6 c) ++ " " ++ take 5 c

main :: IO ()
main = print $ rvrs "Curry is awesome!"