-- 1
data Weekday =
  Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
-- a) Weekday is a type with five data constructors

-- 2
f Friday = "Miller Time"
-- c) f :: Weekday -> String

-- 3
-- b)

-- 4
g xs = xs !! (length xs - 1)
-- c) delivers the final element of xs
