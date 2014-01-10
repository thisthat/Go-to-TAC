--http://en.wikibooks.org/wiki/Haskell/Continuation_passing_style
add :: Int -> Int -> Int
add x y = x + y

add_cps :: Int -> Int -> ((Int -> r) -> r)
add_cps x y = \k -> k (add x y)

--add_cps 2 3 add_cps 3 print -> 8