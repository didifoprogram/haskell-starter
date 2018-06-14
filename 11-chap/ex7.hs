-- The Quad

-- 1
data Quad =
  One
  | Two
  | Three
  | Four
  deriving (Eq, Show)

eQuad :: Either Quad Quad
-- 8 forms
{-
Left One
Left Two
Left Three
Left Four
Right One
Right Two
RIght Three
Right Four
-}

-- 2
prodQuad :: (Quad, Quad)
-- 4 * 4 = 16

-- 3
funcQuad :: Quad -> Quad
-- 4 ^ 4 = 256

-- 4
prodBool :: (Bool, Bool, Bool)
-- 2^3 or 2 * 2 * 2 == 8
{-
T T T
T T F
T F T
F T T
F T F
F F F
F F T
T F F
-}

-- 5
gTwo :: Bool -> Bool -> Bool
-- 2 ^ (2 * 2) == (2 ^ 2) ^ 2 == 16

-- 6
fTwo :: Bool -> Quad -> Quad
-- 4 ^ (4 * 2) == (4 ^ 4) ^ 2 == 65536
