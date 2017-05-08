module CountTree (CountTree, empty, get, getAll, count) where

import qualified BSTree as BST

data CountTree a = CT (BST.BSTree a Int)

empty :: CountTree a
empty = CT BST.empty

get :: Ord a => CountTree a -> a -> Int
get (CT tree) x = maybe 0 id (BST.search tree x)

getAll :: CountTree a -> [(a, Int)]
getAll (CT tree) = BST.inOrderWalk tree

count :: Ord a => CountTree a -> a -> CountTree a
count ct@(CT tree) x = CT tree' where
                       tree' = BST.updateOrInsert tree (x, c)
                       c     = (get ct x) + 1
