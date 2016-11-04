

data Exp a = Soma (Exp a) (Exp a)
           | Numero a
           | X
           
avalie :: Exp a -> a -> a
Numero :: a -> Exp a
X :: Exp a

-------

class Numero a where
   (+) (-) (*) :: a -> a -> a
   fromInt :: Int -> a
   (^) :: a -> Int -> a

instance Numero (Exp Float) where
   x + y = Soma x y
   x - y = Sub x y
   x * y = Produto x y
   x ^ y = Pot x y
   fromInt i = Numero (fromInt i)
   
{-

> Soma X (Numero 2)
> X + 2

-}

class Show a where
   show :: a -> String
   
-- instance (Show a) => Show (Exp a) where
instance Show (Exp Float) where
   show X  = "x"
   show (Numero x) = show x
   
   show (Soma x y) = (show x) ++ " + " ++ (show y)
   
   {-
   
    > :t Soma (Numero 2) X
    
    > :t 2
    Numero a => a
    > :t (Numero 2)
    Numero a => Exp a
    
    > Soma (Numero 2) X :: Exp Float
    
    > Soma X (Produto X X)
    X + X * X
    > Produto (Soma X X) X
    X + X * X
    
    -}