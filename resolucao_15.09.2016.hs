   {-

      Implementar as seguintes funcoes
         mergeSort l
         insertionSort l
         sectionSort l
         bubleSort l

         flat [[1,2,3],[4,5,6]] = [1,2,3,4,5,6]
         update [1,2,3,4] 1 5 = [1,5,3,4]
         update2 [1,2,3,4] [1,3] [4,1] = [1,4,3,1]

   -}


-- mergeSort :: [Int] -> [Int]

mergeSort [] = []
mergeSort [a] = [a]
mergeSort l
   | head l1 > head l2 = (head l1):(mergeSort ((drop 1 l1) ++ l2))
   | otherwise = (head l2):(mergeSort ((drop 1 l2) ++ l1))
   where
    l1 = mergeSort (take (div (length l) 2) l)
    l2 = mergeSort (drop (div (length l) 2) l)

-- insertionSort :: [Int] -> [Int]

insertionSort [] = []
insertionSort l = insereOrdem [] l where
   insereOrdem l [] = l
   insereOrdem l (h:t)
      | l == [] = insereOrdem [h] t
      | otherwise = insereOrdem ([x | x <- l, x >= h] ++ [h] ++ [x | x <- l, x < h]) t

-- selectionSort :: [Int] -> [Int]

selectionSort [] = []
{-
selectionSort l = insereMenor [] l

remove n l
   | l == [] = []
   | otherwise = [x | x <- l, x /= n]

menor n l
   | l == [] = [n]
   | n < (head l) = menor n (tail l)
   | otherwise = menor (head l) (tail l)

insereMenor l m
   | m == [] = l
   | otherwise insereMenor (l ++ [menor (head l) l]) (remove (menor (menor (head l) l)))
-}

-- bubleSort [Int] -> [Int]

bubleSort [] = []
bubleSort (h1:h2:t) = []

-- flat :: [[a]] -> [a]

flat [] = []
flat (h:t) = h ++ flat t

-- update [Int] -> Int -> Int -> [Int]

update list position up
   | list == [] = [up]
   | otherwise = (take position list) ++ [up] ++ (drop (position+1) list)

-- update2 [Int] -> [Int] -> [Int] -> [Int]

update2 list position up
   | list == [] = up
   | position == [] = list
   | up == [] = list
   | otherwise = update2 ((take (head position) list)
      ++ [head up]
      ++ (drop ((head position)+1) list)) (tail position) (tail up)







