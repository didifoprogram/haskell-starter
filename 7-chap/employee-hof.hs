data Employee = Coder
              | Manager
              | Veep
              | CEO
              deriving (Eq, Ord, Show)

reportBoss :: Employee -> Employee -> IO ()
reportBoss e e' =
  putStrLn $ show e ++ " is the boss of " ++ show e'

employeeRank :: ( Employee
                -> Employee
                -> Ordering )
                -> Employee
                -> Employee
                -> IO ()

codersRuleCEODrool :: Employee
                   -> Employee
                   -> Ordering
codersRuleCEODrool Coder Coder = EQ
codersRuleCEODrool Coder _ = GT
codersRuleCEODrool _ Coder = LT
codersRuleCEODrool e e' = compare e e'

employeeRank f e e' =
  case f e e' of
    GT -> reportBoss e e'
    EQ -> putStrLn "Neither employee is the boss"
    LT -> (flip reportBoss) e e'
