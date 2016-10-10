nat = 0:(sucessor nat) where
	sucessor (h:t) = (h+1):(sucessor t)

{-

nat = n1
n1 = 0:n2
n2 = sucessor n1 = 1:n3
n3 = sucessor n2 = 2:n4
n4 = sucessor n3
...

-}

fib = 1:1:(soma fib f1) where
	soma (h1:t1) (h2:t2) = (h1+h2):(soma t1 t2)
	f1 = tail fib

{-

fib = n1
n1 = 1:1:n2
n2 = soma fib f1 => ((head fib)+(head f1)):n3 => (1 + head (tail fib)):n3
   (1+1):n3
n3 = soma (tail fib) (tail f1) => 

-}

-- fat = 1:2:6:24:120...

fat = 1:(fats fat 2) where
	fats (h:t) n = (h*n):(fats t (n+1))

{-

random = 42:r1:r2:r3:...

r(n+1) = (a * rn + b) % n

a = 17
b = 49
n = 255

-}

random = 42:(proximo random) where
	proximo (h:t) = (mod (x * h + y) m):(proximo t) where
		x = 25731
		y = 13849
		m = 65536