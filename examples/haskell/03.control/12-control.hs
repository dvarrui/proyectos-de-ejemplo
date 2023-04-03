demo2 :: IO ()
demo2 = do
  putStrLn "Demo2: case"
  putStrLn "Think a number between 1 to 100"
  game 1 100
  putStrLn "\nBye!\n"

game :: Int -> Int -> IO ()
game a b = do
  putStr("  Is (l)esser/(g)reeter/e)qual than " ++ show number ++ "? ")
  option <- getLine
  case option of
    "l" -> game a (number - 1)
    "g" -> game (number + 1) b
    "e" -> return ()
    _   -> game a b
  where
    number = (a+b) `div` 2

main = demo2
