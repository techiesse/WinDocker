module Commands where

import Support
import DockerX

cmdMap =
    [
        ("stop-all", stopAll),
        ("rm-all", rmAll)
    ]


stopAll :: [String] -> IO ()
stopAll args = do
    listContainers >>= mapM_ (stopContainer args)
    putStrLn "Containers successfully stopped"


rmAll :: [String] -> IO ()
rmAll args = do
    listContainers >>= mapM_ (removeContainer args)
    putStrLn "Containers successfully stopped"
