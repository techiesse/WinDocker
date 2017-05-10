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
    listContainers >>= allAction stopContainer
    putStrLn "Containers successfully stopped"


rmAll :: [String] -> IO ()
rmAll args = do
    listContainers >>= allAction removeContainer
    putStrLn "Containers successfully removed"
