module BSTree (BSTree, empty, isEmpty, insert, search, myMax, myMin) where

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

isEmptyLTree :: BSTree k v -> Bool
isEmptyLTree Empty = True
isEmptyLTree (Branch key val Empty rt) = True
isEmptyLTree (Branch key val lt rt) = False

isEmptyRTree :: BSTree k v -> Bool
isEmptyRTree Empty = True
isEmptyRTree (Branch key val lt Empty) = True
isEmptyRTree (Branch key val lt rt) = False

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

search :: Ord k => BSTree k v -> k -> Maybe v
search Empty key = Nothing
search (Branch key' val' lt rt) key = decide (myCmp key key') where
                                      decide L = search lt key
                                      decide E = Just val'
                                      decide G = search rt key

extreme :: (BSTree k v -> Bool) -> (BSTree k v -> BSTree k v) -> BSTree k v -> Maybe v
extreme isEmpty descend Empty = Nothing
extreme isEmptySubTree descend tree = myIf
                                      (isEmptySubTree tree)
                                      (getVal tree)
                                      (extreme isEmptySubTree descend (descend tree))

myMax :: BSTree k v -> Maybe v
myMax = extreme isEmptyRTree rtree

myMin :: BSTree k v -> Maybe v
myMin = extreme isEmptyLTree ltree


preOrderWalk :: BSTree k v -> [v]
preOrderWalk = undefined

inOrderWalk :: BSTree k v -> [v]
inOrderWalk Empty = []
inOrderWalk tree@(Branch key' val' lt rt) =inOrderWalk lt ++ [val'] ++ inOrderWalk rt

postOrderWalk :: BSTree k v -> [v]
postOrderWalk (Branch key' val' lt rt) = postOrderWalk lt ++ postOrderWalk rt ++ [val'] 

-- Escreva folds para arvores, tambem no arquivo BSTree.hs, e as exporte

foldlTree :: (a -> b -> a) -> a -> BSTree k b -> a
foldlTree = undefined

foldrTree :: (a -> b -> b) -> b -> BSTree k a -> b
foldrTree = undefined

-- Escreva a funcao abaixo, que atualiza o elemento associado a uma chave.
-- Escreva no arquivo BSTree.hs e a exporte.

update :: (Ord k) => BSTree k v -> (k, v) -> BSTree k v
update = undefined
