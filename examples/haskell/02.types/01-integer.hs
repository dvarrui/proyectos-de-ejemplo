add :: Integer -> Integer -> Integer   --function declaration
add x y =  x + y                       --function definition
main = do 
  putStrLn "La suma de ambos números es la siguiente:"
  print(add 3 5)    --calling a function
