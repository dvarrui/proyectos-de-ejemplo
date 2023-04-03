demo1 = do
  print("What's your name?")
  name <- getLine
  print("Hello, " ++ name ++ "!")
  putStrLn("\n\tBye!\n")

main = demo1
