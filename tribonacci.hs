

tribonacci :: (Int,Int,Int) -> Int -> [Int]
tribonacci (x,y,z) n
   | n <= 0 = []
   | n == 1 = [x]
   | n == 2 = [x,y]
   | n == 3 = [x,y,z]
   | otherwise = [x,y,z] ++ (trib (x,y,z) (n-3)) where
   	   trib _ 0 = []
   	   trib (a,b,c) n = [(a+b+c)] ++ (trib (b,c,a+b+c) (n-1))