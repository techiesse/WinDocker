module Support where

import Data.String.Utils
import System.Environment
import System.IO
import System.Process


allAction :: (String -> IO()) -> [String] -> IO()
allAction action [] = return ()
allAction action (pid:pids) = action pid >> allAction action pids


executeCommand :: String -> IO String
executeCommand cmd = do
    putStrLn $ "Executando comando: " ++ cmd
    (_, hout, _, pHandle ) <- createProcess (shell cmd) {std_out = CreatePipe}
    let output =
            case hout of
                Nothing -> return ""
                Just handle -> hGetContents handle >>= (return . strip)
    waitForProcess pHandle
    output
