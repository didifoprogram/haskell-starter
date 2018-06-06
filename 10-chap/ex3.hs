module Ex3 where

fibs = 1 : scanl (+) 1 fibs
-- 1
fibs20 = take 20 fibs

-- 2
fibsLT100 = takeWhile (< 100) fibs

-- 3
facts = scanl (*) 1 [2..]

facts' = take 10 facts

