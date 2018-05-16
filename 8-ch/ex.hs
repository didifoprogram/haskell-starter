-- 1)
-- d) [[Boll]]

-- 2)
-- b) [[3 == 3], [6 > 5], [3 < 4]]

-- 3)
-- d)

-- 4)
-- b)
n
-- Reviewing currying
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"


-- Recursion
-- 1)
{-
dividedBy 15 2
= (go (15 - 2) 2 (0 + 1))
= (go (13 - 2) 2 (1 + 1))
= (go (11 - 2) 2 (2 + 1))
= (go (9 - 2)  2 (3 + 1))
= (go (7 - 2)  2 (4 + 1))
= (go (5 - 2)  2 (5 + 1))
= (go (3 - 2)  2 (6 + 1))
now it will be (1 - 2) so we just return the tuple with ((6+1), 1)
= (7, 1)
-}

-- 2)
-- sum all numbers from 1..n
sumAll :: (Eq a, Num a) => a -> a
sumAll 0 = 0
sumAll n =
  sumAll (n-1) + n

{-
 sumAll 5 = sumAll (4) + 5
 sumAll 4 = sumAll (3) + 4
 sumAll 3 = sumAll (2) + 3
 sumAll 2 = sumAll (1) + 2
 sumAll 1 = sumAll (0) + 1
when sumAll (0) is called it return 0 and go up substituing the functions
with the values

 sumAll 5 = 10 + 5 == 15
 sumAll 4 = 6 + 4
 sumAll 3 = 3 + 3 -- 3 is the sum of 1 + 2
 sumAll 2 = 1 + 2 -- here 1 is the sum of 0 + 1
 sumAll 1 = 0 + 1
-}

-- 3)
-- multAll 3 5
multAll :: (Integral a) => a -> a -> a
multAll _ 0 = 0
multAll 0 _ = 0
multAll x 1 = x -- when we rech 1 we return x to start summing x with x
multAll x y =
  multAll x (y - 1) + x

{-
multAll 3 5 = multAll 3 (5 - 1) + 3
multAll 3 4 = multAll 3 (4 - 1) + 3
multAll 3 3 = multAll 3 (3 - 1) + 3
multAll 3 2 = multAll 3 (2 - 1) + 3
when it calls multAll 3 (2 - 1) it returns x which is 3, then

= 15
multAll 3 5 = 12 + 3
multAll 3 4 = 9 + 3
multAll 3 3 = 6 + 3
multAll 3 2 = 3 + 3
-}


-- McCarthy 91 function
mc91 :: Integer -> Integer
mc91 x
  | x > 100 = x - 10
  | otherwise = mc91 . mc91 $ (x + 11)
{-
mc91 85
mc91 (mc91 96)
mc91 (mc91 (mc91 107))
mc91 (mc91 97)
mc91 (mc91 (mc91 108))
mc91 (mc91 98)
mc91 (mc91 (mc91 109))
mc91 (mc91 99)
mc91 (mc91 (mc91 110))
mc91 (mc91 100)
mc91 (mc91 (mc91 111))
mc91 (mc91 101)
mc91 (91) -- remove one recursive call
mc91 (mc91 (mc91 102))
mc91 (mc91 92)
mc91 (mc91 (mc91 103))
mc91 (mc91 93)
mc91 (mc91 (mc91 104))
mc91 (mc91 94)
mc91 (mc91 (mc91 105))
mc91 (mc91 95)
mc91 (mc91 (mc91 106))
mc91 (mc91 96)
mc91 (mc91 (mc91 107))
mc91 (mc91 97)
mc91 (mc91 (mc91 108))
mc91 (mc91 98)
mc91 (mc91 (mc91 109))
mc91 (mc91 99)
mc91 (mc91 (mc91 110))
mc91 (mc91 100)
mc91 (mc91 (mc91 111))
mc91 (mc91 101)
mc91 (91) -- last recursive call
-}
