module ProjectFind where

type FileName = String

findProjectFile :: (MonadIO m, MonadError FindFileError m) => FileName -> m
findProjectFile =
