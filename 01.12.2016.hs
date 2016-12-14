{-

nat = 0 | s nat

f 0 = 0
f x = x + f (x-1)

g x = x * (x+1) /2

Para todo x € N,
peovar que f x = g x usando inducao:

1) Mostrar que f 0 = g 0

   f 0 = 0
   g 0 = 0 * (0+1) /2 = 0
   
2) Supondo que f x = g x, mostrar que f(x+1) = g (x+1)

   f (x+1) = (x+1) + f (x+1-1)
   = (x+1) + f x, mas f x = g x
   f (x+1) = (x+1) + g x = (x+1) + x*(x+1)/2
   = (2*(x+1) + x*(x+1))/2
   f (x+1) = (x+1)*(2+x)/2 = g(x+1)
   
   g (x+1) = (x+1)*(x+1+1)/2
   = (x+1)*(x+2)/2
   
   data Lista n = Vazio |
                 No n (Lista n)
                 
   tam Vazio = 0
   tam (No h t) = 1 + tam t
   
   conc Vazio l2 = l2
   conc (No h t) l2 = No h (conc t l2)
   
Mostrar que tam (conc l1 l2) = tam l1 + tam l2
Provar por inducao estrutural em l1.

1) l1 = Vazio:
      tam (conc Vazio l2) = tam Vazio + tam l2
      tam l2 = 0 + tam l2
      tam l2 = tam l2

2) Considerar que vale para um l
   tam (conc l l2) = tam l + tam l2
Mostrar que vale lara: No n l

   tam (conc l l2) = tam l + tam l2
   tam (No n l) + tam l2 = 1 + tam l + tam l2
   = 1 + tam (conc l l2)
   tam (conc (No n l) l2) = tam (No n (conc l l2))
   = 1 + tam (conc l l2)
   
   
   rev Vazio = Vazio
   rev (No h t) = conc (rev t) (No h Vazio)
   
   tam (rev l) = tam l ??
   rev (conc l1 l2) = conc (rev l2) (rev l1)
   
-}