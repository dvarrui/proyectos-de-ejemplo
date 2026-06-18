numbers = [ 4, -2, 0, 1, -4, -1, 2, 7, -7 ]
negative xs = [ x | x <- xs, x < 0]

main :: IO ()
main = do
  print(negative numbers)
