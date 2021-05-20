--Dounglan Cheung
--dcheun01@syr.edu
--HW8
--11.7.19
import BinaryTrees
import AltBinaryTrees

isLeaf :: BTree a -> Bool
isLeaf (BNode v Empty Empty) = True
isLeaf _ = False 

tree0 :: BTree a
tree0 = Empty

atree0 :: AltTree Int
atree0 = Leaf 0

--e1
--calculates the height of tree btr. For an empty tree, return -1.
height :: BTree a -> Int
height Empty = -1
height (BNode v left right) = 1 + max (height left) (height right)

--e2
--creates a new tree that looks like btr except that every node’s label is multiplied by n.
multTree :: Int -> BTree Int -> BTree Int
multTree n Empty = Empty
multTree n (BNode v left right) = BNode (v*n) (multTree n left) (multTree n right)

--e3
--returns a list containing the labels of all interior nodes in the tree btr.
interiors :: BTree a -> [a]
interiors Empty = []
interiors (BNode v Empty Empty) = []
interiors (BNode v left right) = v : interiors left ++ interiors right

--e4
--determines whether btr is a full binary tree. For example full tree1 and full tree5 both return True, but full tree2 and full tree3 both return False.
full :: BTree a -> Bool
full Empty = False
full (BNode v Empty Empty) = True
full (BNode v left Empty) = False
full (BNode v Empty right) = False
full (BNode v left right) = full (left) && full (right)

--e5
--calculates height of altTree
heightA :: AltTree a -> Int
heightA (Leaf a) = 0
heightA (One a (altr)) = 1 + heightA altr
heightA (Two a altr altr1) = 1 + max (heightA altr) (heightA altr1)

--e6
--multiplies the node with the n variable
multTreeA :: Int -> AltTree Int -> AltTree Int
multTreeA n (Leaf a) = Leaf (a*n)
multTreeA n (One a altr) = (One (a*n) (multTreeA n altr))
multTreeA n (Two a altr altr1) = (Two (a*n) (multTreeA (n) altr) (multTreeA (n) altr1))

--e7
--finds all the interior nodes with full set of childs, ignoring ones with empty
interiorsA :: AltTree a -> [a]
interiorsA (Leaf a) = []
interiorsA (One a altr) = a: interiorsA altr
interiorsA (Two a altr altr1) = a: interiorsA altr ++ interiorsA altr1

--e8
--
fullA :: AltTree a -> Bool
fullA (Leaf a) = True
fullA (One a altr) = not (fullA altr)
fullA (Two a altr altr1) = fullA altr && fullA altr1

--e9
--convert alternate tree to binary tree
convert :: AltTree a -> BTree a
convert (Leaf a) = (BNode a Empty Empty)
convert (One a altr) = (BNode a (convert altr) Empty)
convert (Two a altr altr1) = (BNode a (convert altr) (convert altr1))

--e10
--creates a complete tree with 'x' nodes, w/ labels
--root node is 1
--1st, write helper funct that takes 2 ints - tot. # of nodes to appear in tree, and the index of current node to be created
makeComplete :: Int -> BTree Int
makeComplete x = complete x 1

complete :: Int -> Int -> BTree Int
complete x y        --x is tot. number of nodes, y is the number of current node
    | y > x = Empty
    | otherwise = (BNode y (complete (x) (2*y)) (complete (x) (2*y+1)))