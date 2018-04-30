-- 1
data Person = Person Bool deriving Show
printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- 2
data Mood = Blah
          | Woot deriving (Eq, Show)

settleDown x = if x == Woot
                  then Blah
               else x

-- 3

-- 4
type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 = Sentence "dogs" "drool" "new"
s2 = Sentence "Julie" "loves" "dogs"

-- Given a datatype declaration, what can we do?
data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah deriving (Eq, Show)


-- 1
-- phew = Papu "chases" True -- Will not typecheck...
-- Papu needs Rocks and Yeah types, but we passed a [Char] and Bool types,
-- so it will complain.
phew = Papu (Rocks "chases") (Yeah True) -- this is right

-- 2
truth = Papu (Rocks "chomskydoz")
        (Yeah True) -- this works

-- 3
equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p' -- this works because Papu,Rocks,Yeah derive Eq

-- 4
-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p' -- have to implement instance for Papu Ord

-- Match the types
-- 1 a)
i :: Num a => a
i = 1

-- b)
-- i :: a
-- i = 1 This won't work because a is too general
-- Haskell now that 'i' is a Num because i=1, and can only go deep into the num
--class

-- 2
-- a)
f :: Float
f = 1.0

-- b)
-- f :: Num a => a -- If we only declare 'f = 1.0', haskell will perform
-- type inference and make it a Double, but when we declare the type
-- Num a => a, it Wont work because 'f = 1.0' is a Fractional.. It will only
-- work if we'd choose f :: Float or f :: Double, Fractional, RealFrac etc...


-- 3
-- a)
g :: Float
g = 1.0

-- b)
-- g :: Fractional a => a -- It works


-- 5
freud :: a -> a
freud x = x
-- freud :: Ord a => a -> a -- WORKS
-- From polymorphic a to constrained polymorphic Ord a

-- 6
-- a)
freud' :: a -> a
freud' x = x

-- b) freud' :: Int -> Int -- WORKS, same as above

-- 7
myX = 1 :: Int
sigmund :: Int -> Int
sigmund x = myX

-- b) sigmund :: a -> a -- Won't work, can't go from Int to a, Haskell already
-- nows that myX is an Int, so it will only accept Int type.

--8
-- sigmund' :: Num a => a -> a -- Won't work, same as above.
-- Can't go from Int to Num
-- sigmund' x = myX

--9
-- a)
--jung :: Ord a => [a] -> a
--jung xs = head (sort xs)

-- b) junt :: [Int] -> Int -Works because Int implements Ord so it can be sorted

-- 10


-- 11
-- a)
--mySort :: [Char] -> [Char]
--mySort = sort

--signifier :: [Char] -> Char
--signifier xs = head (mySort xs)

-- b) signifier :: Ord a => [a] -> a - Won't work because mySort expects an
-- [Char] but Ord accept for exemple an [Int].


-- Type-Kwon-Do Two: Electric Typealoo

-- 1
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f a b = f a == b -- We can test b == b because b has Eq instance.

-- 2
arith :: Num b => (a -> b) -> Integer -> a -> b
arith f x a = f a + fromInteger x -- x is already a Integer
-- we can't do Num a + Integer b
