module Ex5 where
--1
myZip :: [a] -> [b] -> [(a,b)]
myZip _ [] = []
myZip [] _ = []
myZip (x:xs) (x':xs') = (x,x') : myZip xs xs'

--2
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ _ [] = []
myZipWith _ [] _ = []
myZipWith f (x:xs) (x':xs') = f x x' : myZipWith f xs xs'
