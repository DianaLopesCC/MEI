module CodigosPostais
  ( CodigoPostal (..)
  , codigosPostais
  ) where

import Utils

import Data.List

data CodigoPostal
  = CodigoPostal
  { cpCodigo     :: String
  , cpLocalidade :: String
  , cpRua        :: String
  } deriving (Eq, Show)

codigosPostais :: FilePath -> IO [CodigoPostal]
codigosPostais fp = do
  cpdata  <- readFile fp
  return $ map (\ l -> CodigoPostal
           { cpCodigo     = trim $ mergeSpaces $ l!!14 ++ "-" ++ l!!15
           , cpLocalidade = trim $ mergeSpaces $ l!!3
           , cpRua        = trim $ mergeSpaces $ intercalate " " (map (l!!) [5..9])
           })
         $ map (splitOn ',') -- dividir linha pelas vírgulas
         $ drop 1            -- remove o cabeçalho
         $ lines cpdata      -- cada linha é um código postal
