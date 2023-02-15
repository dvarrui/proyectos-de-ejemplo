factorial :: (Integral a) => a -> a
factorial n = product [1..n]

main :: IO ()
main = print("factorial de 5", factorial 5)
