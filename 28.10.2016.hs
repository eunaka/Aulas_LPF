{-

Arvores de expressoes

2 + 3 * 4

     +
   /   \
 2      *
      /   \
     3    4



data Exp = Num Int
         | Soma Exp Exp
         | Produto Exp Exp
         | Subt Exp Exp
         | Div Exp Exp
          deriving Show

Soma (Num 2) (Produto (Num 3) (Num 4))

avalie :: Exp -> Int
avalie (Num n) = n
avalie (Soma e1 e2) = (avalie e1) + (avalie e2)

-}

data Exp = Num Float | X
         | Soma Exp Exp
         | Produto Exp Exp
         | Subt Exp Exp
         | Div Exp Exp
         | Pot Exp Float
          deriving Show

avalie :: Exp -> Float -> Float
avalie (Num n) x = n
avalie (Soma e1 e2) x = (avalie e1 x) + (avalie e2 x)
avalie (Produto e1 e2) x = (avalie e1 x) * (avalie e2 x)
avalie (Subt e1 e2) x = (avalie e1 x) - (avalie e2 x)
avalie (Div e1 e2) x = (avalie e1 x) / (avalie e2 x)
avalie X x = x

ex1 = avalie (Soma X (Num 8)) 5
f = avalie (Produto (Soma X (Num 4)) (Num 3))
g x = (x + 4) * 3
ex2 = Soma (Pot X 2) (Produto (Num 2) X)
ex3 = derivada ex2
h = derivada' (avalie ex2)
i = avalie (derivada ex2)
l0 = map (avalie ex2) [1.0, 1.1..]
l1 = map h [1.0, 1.1 .. 10]
l2 = map i [1.0, 1.1 .. 10]

-- Computacao simbolica
derivada :: Exp -> Exp
derivada (Num n) = Num 0
derivada X = Num 1
derivada (Soma e1 e2) = Soma (derivada e1) (derivada e2)
-- derivada (Produto e1 e2) = Div ((Subt ()))
derivada (Pot e n) = Produto (Num n) (Produto (Pot e (n-1)) (derivada e))


derivada' :: (Float -> Float) -> (Float -> Float)
derivada' f x = (f(x+h) - f x) / h where h = 0.001

{-

z = 5
x = 1
y = 2
a = x + 2y + z3
print 2 * x

-}