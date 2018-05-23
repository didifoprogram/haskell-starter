module PlayGround where

safeTail :: [a] -> Maybe [a]
safeTail (x:[]) = Nothing
safeTail [] = Nothing
safeTail (_:xs) = Just xs

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

hello 0 = return ()
hello n = do
  putStrLn "Hello World"
  hello (n-1)

main :: IO()
main = do
    n <- readLn :: IO Int
    hello n
