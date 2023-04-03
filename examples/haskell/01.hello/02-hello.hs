-- modo 1: Compilar y ejecutar
--   ghc FILE.hs
--   ./FILE
-- modo 2: Ejecutar directamente
--   runhaskell FILE
--   runghc FILE
-- modo 3: Usando REPL
--   ghci
--   :load 03-hello.hs
--   main

-- Definición de tipo opcional, porque puede inferirse
-- Se recomienda escribir siempre las firmas/tipos
main :: IO ()
main = putStrLn "Hello, World!"
