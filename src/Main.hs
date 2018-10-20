-- | This module is based on the HieWrapper.hs in the haskell-ide-wrapper repo:
-- https://github.com/haskell/haskell-ide-engine/blob/master/app/HieWrapper.hs
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Main where

import           Control.Monad.Except   (MonadError, throwError)
import           Control.Monad.IO.Class (MonadIO, liftIO)
import           Data.List              (intercalate)
import qualified System.Environment     as Sys
import qualified System.Process         as Sys

main :: IO ()
main = do
  -- Feed arguments provided thru to hie-wrapper executable, not nix-shell
        args <- Sys.getArgs

        let
          -- if args has r or project root, use that, otherwise set project root
            hieCommand = intercalate " " ("hie-wrapper" : args)

        (_, _, _, p) <-
                Sys.createProcess (Sys.proc "nix-shell" ["--run", hieCommand])
                        { Sys.cwd = Just "/home/sam/code/fp/hie-nix-wrapper"
                        , Sys.delegate_ctlc = True
                        }
        Sys.waitForProcess p
        pure ()

test :: IO ()
test = do
  -- Feed arguments provided thru to hie-wrapper executable, not nix-shell
        args <- Sys.getArgs

        let
          -- if args has r or project root, use that, otherwise set project root
            hieCommand = intercalate " " ("hie-wrapper" : args)

        (_, _, _, p) <-
                Sys.createProcess (Sys.proc "nix-shell" ["--run", hieCommand])
                        { Sys.cwd = Just "/home/sam/code/fp/hie-nix-wrapper"
                        , Sys.delegate_ctlc = True
                        }
        Sys.waitForProcess p
        pure ()

type FileName = String

data FindFileError = Error -- ^ Test

findProjectFile :: (Monad m, MonadIO m, MonadError FindFileError m) => FileName -> m FilePath
findProjectFile file = do
  liftIO $ pure "Test"
