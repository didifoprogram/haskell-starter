module BinaryTreeToList where

data BinaryTree a =
  Leaf | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Ord, Show)

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left a right) = [a] ++ preorder left ++ preorder right


inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left a right) = inorder left ++ [a] ++ inorder right

postorder :: BinaryTree a -> [a]
postorder Leaf= []
postorder (Node left a right) = postorder right ++ [a] ++ postorder left

testTree :: BinaryTree Integer
testTree =
  Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder =
  if preorder testTree == [2, 1, 3]
  then putStrLn "Preorder fine!"
  else putStrLn "Bad news bears."

testInorder :: IO ()
testInorder =
  if inorder testTree == [1, 2, 3]
  then putStrLn "Inorder fine!"
  else putStrLn "Bad news bears."

testPostorder :: IO ()
testPostorder =
  if postorder testTree == [3, 2, 1]
  then putStrLn "Postorder fine!"
  else putStrLn "Bad news bears."

main = do
  testPreorder
  testInorder
  testPostorder

foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree _ b Leaf = b
foldTree f b (Node left a right) = foldTree f (foldTree f (f a b) left) right

-- Node (Node Leaf 2 Leaf) 3 (Node Leaf 5 Leaf)
-- foldTree (*) 1 (Node (Node Leaf 2 Leaf) 3 (Node Leaf 5 Leaf)) = 30
