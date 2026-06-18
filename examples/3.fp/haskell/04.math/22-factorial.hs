factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = print("factorial de 5", factorial 5)
