import System.IO

main = do
    let name = "leeme.txt"
    contents <- readFile name
    putStrLn $ "==== " ++ name ++ " ===="
    putStr contents
