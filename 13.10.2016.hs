-- Revisao para prova do dia 14/10/2016

apartir n = n:(apartir$n+1)

nat = [2..]

removemultiplos n l = filter (\ x -> mod x n /= 0) l
removemultiplos n l = [x | x <- l, mod x n /= 0]
removemultiplos n l = | mod x n == 0 = removemultiplos n t
                      | otherwise = h:(removemultiplos n t)
{-                      
primos = crivo nat where
   crivo (h:t) = h:crivo (removemultiplos h t)
   
   pascal n = | n == 1 = [1]
              | otherwise = 

   triangulop = 
-}

{-

permutacoes [1,2,3,4] =
   [[1,2,3,4], [1,2,4,3],
    [1,3,2,4], [1,4,3,2], ..., [4,3,2,1]]
    
flat [[1,2,3],[4,5,6],[7,8,9]] = [1,2,3,4,5,6,7,8,9]

uniao [1,2,3] [3,4,5] = [1,2,3,4,5]

diferenca [1,2,3] [3,4,5] = [1,2]

xor [1,2,3] [3,4,5] = [1,2,4,5]

palavras "o rato roeu " = ["o", "rato", "roeu"]

-}