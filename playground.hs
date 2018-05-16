module PlayGround where

safeTail :: [a] -> Maybe [a]
safeTail (x:[]) = Nothing
safeTail [] = Nothing
safeTail (_:xs) = Just xs

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x
