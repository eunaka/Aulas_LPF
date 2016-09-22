{-

22/09/2016
resolução de questões

-}

insertionSort :: [Int] -> [Int]
insertionSort (h:t) = ordem [] h t where
   ordem r h t = let
      list = [x | x <- r, x <= h] ++ [h] ++ [x | x <- r, x > h]
      in
         if(t == []) then list else ordem (list) (head t) (tail t)
  

-- quick sort mais flexível
    
quickSort :: (Int -> Int -> Bool) -> [Int] -> [Int]
quickSort _ [] = []
quickSort _ [a] = [a]
quickSort f (h:t) = (quickSort f [x | x <- t, f h x])
   ++ [h] ++ (quickSort f [x | x <- t, not (f h x)])
   
{-
qsort f l = qsortaux l where
   qsortaux [] = []
   qsortaux [a] = [a]
   qsortaux (h:t) ...
-}    
      
      
      
      