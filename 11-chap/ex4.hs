-- bring Int8 in scope
import Data.Int

-- 1
data BigSmall =
  Big Bool
  | Small Bool
  deriving (Eq, Show)

-- Big Bool = 2
-- SMall Bool = 2
-- 2 + 2 = 4

-- 2
data NumberOrBool =
  Numba Int8
  | BoolyBool Bool
  deriving (Eq, Show)

myNumba = Numba (-128)

-- Numba Int8 = 256
-- BoolyBool Bool = 2
-- 256 + 2 = 258
