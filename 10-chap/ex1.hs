module Ex1 where
--1
-- b, c

-- 2
foldl (flip (*)) 1 [1..3]
f = flip (*)
(((1 `f` 1) `f` 2) `f` 3)

--3
-- c)

--4
--a

--5
--a)
-- foldr (++) ["woot", "WOOT", "woot"]
foldr (++) "WOOT" ["woot", "WOOT", "woot"]

--b)
-- foldr max [] "fear is the little death"
foldr max 'a' "fear is the little death"

--c)
-- foldr and True [False, True]
foldr (&&) True [False, True]

-- d)

--e)
--foldl ((++) . show) "" [1..5]
foldr ((++) . show) "" [1..5]

-- f)
-- foldr const 'a' [1..5]
foldl const 'a' [1..5] -- with foldr the result is 1, but this function
--                        must return a Char because the argument 'a'
(((((const 'a' 1) `const` 2) `const` 3) `const` 4) `const` 5)

-- g)
--foldr const 0 "tacos"
foldl const 0 "tacos"

-- h)
-- foldl (flip const) 0 "burritos"
foldr (flip const) 0 "burritos"

-- i)
-- foldl (flip const) 'z' [1..5]
foldr (flip const) 'z' [1..5]
