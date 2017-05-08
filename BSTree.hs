module BSTree (BSTree, empty, isEmpty, insert, updateOrInsert, search, remove, myMax, myMin, inOrderWalk) where

import Aula3 (myIf)

data BSTree k v = Empty
                | Branch k v (BSTree k v) (BSTree k v)

empty :: BSTree k v
empty = Empty

isEmpty :: BSTree k v -> Bool
isEmpty Empty = True
isEmpty (Branch key val lt rt) = False

data MyOrdering = L | E | G

ltree :: BSTree k v -> BSTree k v
ltree Empty = Empty
ltree (Branch key' val' lt rt) = lt

rtree :: BSTree k v -> BSTree k v
rtree Empty = Empty
rtree (Branch key' val' lt rt) = rt

isEmptySSubtree :: (BSTree k v -> BSTree k v) -> BSTree k v -> Bool
isEmptySSubtree subtree tree = isEmpty (subtree tree)

isEmptyLTree :: BSTree k v -> Bool
isEmptyLTree = isEmptySSubtree ltree

isEmptyRTree :: BSTree k v -> Bool
isEmptyRTree = isEmptySSubtree rtree

getVal :: BSTree k v -> Maybe v
getVal Empty = Nothing
getVal (Branch key val lt rt) = Just val

myCmp :: Ord a => a -> a -> MyOrdering
myCmp x y = myIf (x < y) L
                 (myIf (x > y) G E)

insert :: Ord k => BSTree k v -> (k, v) -> BSTree k v
insert Empty (key, val) = Branch key val empty empty
insert tree@(Branch key' val' lt rt) (key, val) = decide (myCmp key key') where
                                          decide L = Branch key' val' lt' rt
                                          decide E = tree
                                          decide G = Branch key' val' lt rt'
                                          lt' = insert lt (key, val)
                                          rt' = insert rt (key, val)

updateOrInsert :: Ord k => BSTree k v -> (k, v) -> BSTree k v
updateOrInsert Empty (key, val) = Branch key val empty empty
updateOrInsert (Branch key' val' lt rt) (key, val) = decide (myCmp key key') where
                                                     decide L = Branch key' val' lt' rt
                                                     decide E = Branch key val lt rt
                                                     decide G = Branch key' val' lt rt'
                                                     lt' = updateOrInsert lt (key, val)
                                                     rt' = updateOrInsert rt (key, val)

remove :: Ord k => BSTree k v -> k -> BSTree k v
remove Empty key' = Empty
remove tree@(Branch key val lt rt) key' = decide (myCmp key' key) where
                                     decide L = Branch key val lt' rt
                                     decide G = Branch key val lt rt'
                                     decide E = rm tree
                                     lt' = remove lt key'
                                     rt' = remove rt key'
                                     rm (Branch key val Empty Empty) = Empty
                                     rm (Branch key val lt Empty) = lt
                                     rm (Branch key val Empty rt) = rt
                                     rm (Branch key val lt rt) = Branch key'' val'' lt'' rt
                                     (key'', val'') = mostRight lt
                                     mostRight (Branch key val lt Empty) = (key, val)
                                     mostRight (Branch key val lt rt) = mostRight rt
                                     lt'' = remove lt key''

search :: Ord k => BSTree k v -> k -> Maybe v
search Empty key = Nothing
search (Branch key' val' lt rt) key = decide (myCmp key key') where
                                      decide L = search lt key
                                      decide E = Just val'
                                      decide G = search rt key

extreme :: (BSTree k v -> Bool) -> (BSTree k v -> BSTree k v) -> BSTree k v -> Maybe v
extreme isEmptySubTree descend Empty = Nothing
extreme isEmptySubTree descend tree = myIf
                                      (isEmptySubTree tree)
                                      (getVal tree)
                                      (extreme isEmptySubTree descend (descend tree))

myMax :: BSTree k v -> Maybe v
myMax = extreme isEmptyRTree rtree

myMin :: BSTree k v -> Maybe v
myMin = extreme isEmptyLTree ltree

inOrderWalk :: BSTree k v -> [(k, v)]
inOrderWalk Empty = []
inOrderWalk (Branch key val lt rt) = inOrderWalk lt ++ (key, val) : inOrderWalk rt
