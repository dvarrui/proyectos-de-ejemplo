factorial2 :: (Integral a) => a -> a
factorial2 0 = 1
factorial2 n = n * factorial2 (n - 1)

factorial3 :: (Integral a) => a -> a
factorial3 n = product [1..n]

main :: IO ()
main = putStrLn(
  "No hay factorial imperativo en Haskell :-)\n" ++
  "factorial2(5)=" ++ show(factorial2 5) ++
  "\nfactorial3(5)=" ++ show(factorial3 5)
  )
