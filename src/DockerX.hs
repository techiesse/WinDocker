module DockerX where

import Support

listContainers :: IO [String]
listContainers = executeCommand "docker ps -a -q" >>= (return . lines)


stopContainer :: [String] -> String -> IO ()
stopContainer args pid = (executeCommand $ "docker stop " ++ (unwords args) ++ " " ++ pid) >> return ()


removeContainer :: [String] -> String -> IO ()
removeContainer args pid = (executeCommand $ "docker rm " ++ (unwords args) ++ " " ++ pid) >> return ()
