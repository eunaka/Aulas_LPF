{-

   15/09/2016
   resolucao de questoes
   
-}
media :: [Int] -> Int
media l = div (soma l) (length l) where
   soma [] = 0
   soma (h:t) = h + soma t
   {-
   outra forma
      soma l = foldl (+) l 0
   -}
   
   
repetidos :: [Int] -> [Int]
repetidos [] = []
repetidos [a] = [a]
repetidos (h:t) = h:(repetidos (removeTodos h t)) where
   removeTodos n (h:t) =
      if(n == h) then (removeTodos n t)
      else (h:removeTodos n t)
   removeTodos _ [] = []
   
   {-
   outra forma
      removeTodos n (h:t) =
         (if(n == h) then [] else [h])
         ++ (removeTodos n t)
         
      removeTodos n l = filter (\x -> x /= n) l
      
      removeTodos n l = [x|x <- l, x /= n]
   -}
   
quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort (h:t) = quickSort [n|n <- t,n <= h]
   ++ [h] ++ quickSort [n|n <- t,n > h]
   
   {-
   outra forma
      quickSort (filter (\x -> x > h) t)
   -}
   
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

