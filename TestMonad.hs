import Data.IORef

type Counter = Int -> IO Int 
  

makeCounter :: IO Counter
makeCounter = do
    r <- newIORef 0
    return (\i -> do modifyIORef r (+1)
                     readIORef r)

--testCounter :: Counter -> IO Counter
testCounter counter = do
    return (counter 1)

ban counter = do
	putStrLn "Funzione"
	t <- counter 1
	print t

main = do
    counter <- makeCounter
    b <- (counter 1)
    c <- (counter 1)
    d <- (counter 1)
    ban counter