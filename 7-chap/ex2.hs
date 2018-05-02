-- Exercises: Variety Pack

-- 1.
-- a) k :: (a, b) -> a
-- b) k2 :: [Char]
-- c) k and k3 will return 3

-- 2.
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))

