{-
   16/09/2016
-}
{-}
mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort [a] = [a]
mergeSort [a,b] = if a < b then a:[b] else b:[a]
mergeSort l = intercala (mergeSort (take half  l) ++ mergeSort (drop half l)) where
	           half = div (length l) 2
	           intercala m n = if(head m <= head n) then (head m):intercala (tail n)
	              else (head n):intercala (tail m)
-}


mergeSort:: [Int] ->[Int]
mergeSort [] = []
mergeSort [a] = [a]
mergeSort l
	| head l1 > head l2 = (head l1):(mergeSort ((drop 1 l1) ++ l2))
	| otherwise = (head l2):(mergeSort ((drop 1 l2) ++ l1))
	where  
		l1 =  mergeSort (take (div (length l) 2) l) 
		l2 =  mergeSort (drop (div (length l) 2) l) 	
