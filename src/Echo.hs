module Main where

import qualified System.Environment as Sys
import qualified System.Process     as Sys

main :: IO ()
main = do
  Sys.callProcess "cat" []
