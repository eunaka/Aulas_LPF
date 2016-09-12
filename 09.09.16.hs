{-

09/09/2016
Notação lambda em funções que recebem funções.

-}

teste :: Int -> (Int -> Int -> Bool)
teste 0 = (==)
teste 1 = (/=)
teste 2 = (>)
teste 3 = (<)
teste 4 = (>=)
teste 5 = (<=)

adiciona x = \y -> x + y

add x y = x + y


sequencia :: (Int -> Int) -> (Int -> Int) -> (Int -> Int)
sequencia f g = \x -> f (g x)

f_pot :: (Int -> Int) -> Int -> (Int -> Int)
f_pot f 0 = \x -> x
f_pot f n = \x -> f_pot f(n-1) (f x)

-- f_pot (adiciona 3) 5 8

map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f (h:t) = (f h):(map' f t)

-- map' (adiciona 2) [4,6,9]
-- map' (\x -> 2 * x + 1) [1 .. 5]

filter' :: (a -> Bool) -> [a] -> [a]
filter' f [] = []
filter' f (h:t) = if (f h) then
                    h:(filter' f t)
                 else
                    filter' f t

-- filter' (\x -> (x < 10) && (x > 2)) [0..20]


foldl' :: (a -> b -> b) -> [a] -> b -> b
foldl' f [] n = n
foldl' f (h:t) n = f (foldl' f t n) h

-- foldl' (\x y -> x + y) [1,2,3] 0




{-
Usando as operações map, foldl e filter, além de outras funções de lista defina funções que calculem:
a) média dos valores de uma lista
b) remover os valores repetidos de uma lista.
c) Ordenação quicksort.
-}
