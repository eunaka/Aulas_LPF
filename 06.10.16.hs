{-

06/10/2016


 Avaliacao tardia
 
 - Considere:
 
 f x y = x + y
 
    - Calcular:
       f (1+2) (3+5)
       
       -- Em liguagens tradicionais:
          f (1+2) (2+3) => f 3 (2+3) => f 3 5 => 3 + 5 => 8
          
    - Em haskell (avaliacao tardia)
       f (1+2) (2+3) => (1+2) + (2+3) => 3 + (2+3) => 3 + 5 => 8
       
       g x y = if (x > 0) then x else y
       
       -- x = 1+2
       -- y = 2+3
       -- g (1+2) (2+3) => if (x > 0) then x else y
             => x => 3

- Avaliacao Tardia:
   Os argumentos de uma funcao nao sao avaliados antes da execucao
   da funcao. A avaliacao destes eh postergada ao maximo possivel.
   
   g 2 (div 3 0) => 2
   g (-2) (div 3 0) => error
   g (g (1+2) (4+1)) (g (-1) (2+3)) => 3
   
   
-- Vantagens:

   - Computacoes infinitas
   
      seq x = x:(seq (x+1))
      seq 0 = [0,1,2,3,4,5,6,...]
      
      -- take :: Int -> [a] -> [a]
         take 0 l = []
         take n [] = []
         take n (h:t) = (h:take (n-1) t)
         
      take 2 (seq 0) => take 2 (0:seq (0+1)) => 0:(take (2-1) (0+1))
      => 0:(take 1 (0+1)) => 0:(take 1 ((0+1):seq (0+1 + 1)))
      => 0:(0+1):(take (1-1) (seq (0+1 + 1))) => 0:(0+1):[] => [0,1]
   
   soma [] = 0
   soma (h:t) = h + (soma t)
   
   soma [1 .. 100000] => soma 1:[2 .. 100000] => 1 + soma [2..100000]
   => 1 + soma 2:[3..100000] => 1 + 2 + soma [3..100000]
   => 3 + soma [3..100000] => 3 + 3 + soma [4..100000]
   
   -- soma (map (\ x -> x * 2) [1..100000])

-}