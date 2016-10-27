{-

Tipos de dados

type Tipo = Expressao de Tipo

Ex.:


type String = [Char]
type Complex = (Float, Float)
type Nome = String
type Point = (Float, Float)

Declaracao type nao define tipos novos,
apenas "atalhos" para tipos existentes.

module :: Complexo -> Float
module (real, imaginario) = ...

origem :: Ponto
origem = (0,0)

> modulo origem


data : Define novos tipos em Haskell

data Type = Tag Componentes

data Complex = Complex Float Float
im :: Complex
im = Complex 0 1

modulo :: Complex -> Float
modulo (Complex re im) = ...

data Point = Pt Float Float
-- pt :: Float -> Float -> Point

origem :: Point
origem = Pt 0 0
> modulo origem -- error

----------------------------

struct Lista
{
   int val;
   struct Lista *proximo;
};

data Lista = No Int Lista
            | Single Int
            | Vazio
            | Tag4
            | Tag45
            
No 1 (No 2 (No 3 Null)) -- error "nao existr nulo em Haskell"
No 1 (No 2 (Single 3)) 
No 1 (No 2 Vazio)

tam :: Lista -> Int
tam Vazio = 0
tam (No v l) = 1 + tam l

data DiaSemana = Dom | Seg | Ter | Qua
               | Qui | Sex | Sab deriving (Eq, Ord, String, Read)
               
fim_de_semana :: DiaSemana -> Bool
fim_de_semana Sab = True
fim_de_semana Dom = True
fim_de_semana d = False

ou
-- (==)   :: Eq a => a -> a -> Bool
-- (<)    :: Ord a => a -> a -> Bool
-- show   :: Show a => a -> String
-- read   :: Read a => String -> a
-- [a..b] :: Enum a => a -> a -> [a]

fim_de_semana d = if d == Sab || d == Dom
              then True
              else False
              
Definir a declaracao de tipo Complexo com as operacoes
de soma, subtracao, etc

-}