module Main where

import Data.Char
import Data.String.Utils
import System.Environment
import System.IO


import Support
import Commands

-- #############################################################################
main = do
    args <- getArgs
    let cmd = head args
    let maybeProcessor = lookup cmd cmdMap
    case maybeProcessor of
        Nothing -> do -- Fallback to docker
            (executeCommand $ "docker " ++ (unwords args)) >>= putStrLn
        Just processor -> processor $ tail args
