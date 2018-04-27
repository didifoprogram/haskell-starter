-- type-Kwon-Do.hs
module TypeKwonDo where

data Woot
data Blah

f :: Woot -> Blah
f = undefined

g :: (Blah, Woot) -> (Blah, Blah)

g (b, w) = (b, f w)

-- -----------------------------

-- Ex 1
f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h i = g (f i)

-- Ex 2
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e a = w (q a)

-- Ex 3
data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (x, y) = (xz x, yz y)

-- Ex 4
munge :: (x -> y) -> (y -> (w, z)) -> x -> w

munge f g x = fst (g (f x))
