{-

Monads - motivacao

- Haskell eh uma linguagem funcional:
  
   a = f b
   
   a depende apenas de f e de b
   
- Certos tipos de aplicacao nao sao conpativeis com este estilo:

   n = random (1, 10)
   
   a = leia_int()
   b = leia_int()
   
- Solucao: utilizar argumentos extras para representar
o estado nas funcoes e as funcoes retornam os novos
estados alem do valor de retorno

data Maybe a = Just a | Nothing

   n = random (1, 10, s)
   m = random (1, 10, s')
   
   a = leia_int(input)   || input = "1 2"
   b = leia_int(input')  || input = " 2"
   
   (I)   leia_int :: Int
   (II)  leia_int :: String -> (Int, String)
   (III) leia_int :: String -> Maybe (Int, String)
   
   (a, input') = leia_int(input)
   (a, input") = leia_int(input')
   (a, input'") = leia_int(input")
   
   t = leia_int(input)
   if (t == Nothing) then ...
      else let
         Just (a, input') = t
         in
            t' = leia_int(input')
            
-----------------

type Monad : tipo de dado que modela uma computacao
que retorna um valor e encapsula as variaveis de
estado

   (IV) leia_int :: Computacao Int
           type Computacao a = String -> Maybe (a, String)
           
   n = let
          a = leia_int
          b = leia_int
          c = leia_int
      
          in
             a + b + c
             
- Funcoes basicas:
   
   return :: a -> Computacao a
   
   (>>=) bind :: Computacao a -> (a -> Computacao b)
            -> Computacao b
   
-----
   
   n = leia_int >>=\a -> (
          leia_int >>=\b -> (
             leia_int >>=\c ->
                return (a + b + c)
          )
       )
       
-----

   return n = \s -> Just (n, s)
   
   v >>= f = \s -> let
                      t = v
                      
                   in
                      if (t == Nothing) then Nothing
                      else let
                         Just (a, s) = t
                         
                         in f a s'
      
-}
