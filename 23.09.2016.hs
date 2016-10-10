{-

-Execucao parcial


selectionSort :: (Int -> Int -> Bool) -> [Int] -> [Int]
...

ordena_ascendente :: [Int] -> [Int]
ordena_ascendente = selectionSort (\x y -> x > y)


- Uma funcao que recebe 2 ou mais argumentos:

f :: a -> b -> c -> d

pode ser executada com menos argumentos que o necessario e o resultado
eh uma funcao que espera os argumentos restantes.

m :: b -> c -> d
m = f x
n :: c -> d
n = m y


- Em Haskell nao ha diferenca entre uma funcao que recebe 2 argumentos
e uma funcao que recebe 1 argumento e retorna uma funcao.
Notacao Curry

soma :: Int -> Int -> Int
soma x y = x + y

Equivalente a

soma' :: Int -> (Int -> Int)
soma' x = (\y -> x + y)

soma" = \ x y -> x + y


- Eh possivel definir funcoes que nao possam ser executadas parcialmente:
Notacao nao-Curry

soma"' :: (Int, Int) -> Int
soma"' (x,y) = x + y


- Funcoes de conversao:

curry :: ((a,b) -> c) -> (a -> b -> c)

uncurry :: (a -> b -> c) -> ((a,b) -> c)

-}

{-

- Escreva funcoes para:

a) Incrementar os valores de uma lista de inteiros

   incrementa [1,2,3] = [2,3,4]

b) Somar 2 listas

   somaL [1,2,3] [4,5,6] = [5,7,9]

-}

inc [] = []
inc (h:t) = (h+1):(inc t)

-- map :: (a -> b) -> [a] -> [b]
-- inc = map (\ x -> x + 1)


somaL _ [] = []
somaL [] _ = []
somaL (h1:t1) (h2:t2) = (h1+h2):(somaL t1 t2)

-- zip :: [a] -> [b] -> [(a,b)]
--  somaL l1 l2 = map (\ (x,y) -> x + y) (zip l1 l2)
--  somaL l1 l2 = map (uncurry (+)) (zip l1 l2)


{-

- Exercicio:

   all [True, True, False] = False
   some [True, False, True] = True
   andL [True, False, True] [True, True, False] = [True, False, False]
   orL [True, False] [False, True] = [True, True]

- Generaliza as funcoes: somaL, andL e orL

-}

all [] False
all (h:t)
   | h == False = False

some [] = False
some (h:t)
   | h == True = True
   | otherwise = some t

andL l [] = head l
andL [] l = head l
andL (h1:t1) (h2:t2) =