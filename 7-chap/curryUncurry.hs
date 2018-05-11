curry' :: ((a, b) -> c) -> a -> b -> c
curry' f a b = f (a, b)

uncurry' :: (a -> b -> c) -> ((a, b) -> c)
uncurry' f (a, b) = f a b


-- uncurried function,
-- takes a tuple of its arguments
add :: (Int, Int) -> Int
add (x, y) = x + y

add' :: Int -> Int -> Int
add' = curry' add -- the add is the ((a, b) -> c) now: curry' :: Int -> Int -> Int
  -- so (curry' add 10 20) for example.

add'' :: (Int, Int) -> Int
add'' = uncurry' add'
