f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h = f . g


q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e = q . w
