module DockerX where

import Support

listContainers :: IO [String]
listContainers = executeCommand "docker ps -a -q" >>= (return . lines)


stopContainer :: String -> IO ()
stopContainer pid = (executeCommand $ "docker stop " ++ pid) >> return ()


removeContainer :: String -> IO ()
removeContainer pid = (executeCommand $ "docker rm " ++ pid) >> return ()
