-- Deconstruct data

newtype Name = Name String deriving Show
newtype Acres = Acres Int deriving Show

-- FarmerType is a Sum
data FarmerType = DairyFarmer
                | WheatFarmer
                | SoybeanFarmer
                deriving Show

-- Farmer is a plain ole product of
-- Name, Acres, and FarmerType

data Farmer =
  Farmer Name Acres FarmerType
  deriving Show

-- breaking up the data

isDairyFarmer :: Farmer -> Bool
isDairyFarmer (Farmer _ _ DairyFarmer) = True -- DairyFarmer is packed up inside
                                         --  our Farmer product type.
isDairyFarmer _ = False

-- Alternate formulation with a product that uses record syntax:
data FarmerRec =
  FarmerRec { name :: Name
            , acres :: Acres
            , farmerType :: FarmerType}
  deriving Show

isDairyFarmerRec :: FarmerRec -> Bool
isDairyFarmerRec farmer =
  case farmerType farmer of
    DairyFarmer -> True
    _ -> False
