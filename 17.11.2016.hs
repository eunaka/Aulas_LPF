{-

Monads

-E/S, Excecoes, memoria, etc.

class Monad m where
   return :: a -> m a
   (>>=)  :: m a -> (a -> m b) -> m b -- bind
   (>>)   :: m a -> m b -> m b -- sequence
   
Monad IO:

data () = ()

putStr   :: String -> IO ()
putStrLn :: String -> IO ()
getLine  :: IO String
read     :: Read a => String -> a
show     :: Show a => a -> String

helloWorld :: IO ()
helloWorld = putStrLn "hello world"

soma2Numeros :: IO ()
soma2Numeros = putStr "Digite um numero:" >>
             getLine >>= \s1 -> 
              >> putStr "Digite outro numero:" >>
               getLine >>= \s2 ->
                putStr "a soma eh: " ++ (show ((read s1) + ((read s2)) :: Int))
                

soma2Numeros = do
             putStr "digite..." -- >>
             s1 <- getLine
             putStr "digite..."
             s2 <- getLine
             putStr "a soma eh: "...

duasVezes :: IO () -> IO ()
duasVezes x = x >> x
-- duasVezes x = do
               x
               x

> duasVezes soma2Numeros

nVezes :: Int -> IO () -> IO ()
nVezes 0 c = return ()
nVezes x c = c >> nVezes (x-1) c

> nVezes 100 soma2Numeros

duasVezes x = nVezes 2 x
-- duasVezes = nVezes 2

while :: IO Bool -> IO () -> IO ()
while c x = do {
          v <- c
          if v then x >> while c x
          else return ()
          }

simounao :: IO Bool
simounao = do
         putStr "deseja continuar?"
         r <- getLine
         if r == "sim" then return True
         else if r == "nao" then return False
            else
               putStrLn resposta invalida" >>
               simounao
               
               
main = while simounao soma2Numeros

-}