--from http://abc041.contest.atcoder.jp/assignments Question D
-- Time Over in this algorithm
import Data.List

main = do
  p <- getContents
  let n = read $ words (lines p !! 0) !! 0 ::Int
      m = read $ words (lines p !! 0) !! 1 ::Int
      set = map ((map read).words) $ tail $ lines p ::[[Int]]
      re1 = getResult n set
  putStr $ show $ length $getResultForPrint re1 
getResultForPrint :: [Maybe [Int]] -> [[Int]]
getResultForPrint (Nothing :xs)  = getResultForPrint xs
getResultForPrint (Just s : xs)  = s : getResultForPrint xs
getResultForPrint [] = []

-- n -> set -> result             
getResult :: Int -> [[Int]] -> [Maybe [Int]]
getResult n xss = map (judge_just xss) $ permutations [1..n]  

judge_just:: [[Int]] -> [Int] -> Maybe [Int]
judge_just xss ys | judge xss ys  = Just ys
                  | otherwise  = Nothing
                 
-- information -> list -> Bool
judge :: [[Int]] -> [Int] -> Bool
judge ( (x:[y]):xss) ys | (ind_x < ind_y) = True && (judge xss ys)
                   | otherwise = False
  where ind_x = elemIndex x ys
        ind_y = elemIndex y ys
judge [] ys = True

