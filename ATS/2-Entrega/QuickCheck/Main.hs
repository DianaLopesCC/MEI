module Main where

import CodigosPostais
import Nomes
import Utils

import Control.Monad
import Control.Monad.State.Strict
import Test.QuickCheck
import Data.Char


-- | Função principal.
main :: IO ()
main = do
  cps <- codigosPostais "codigos_postais.csv"
  samples <- generate $ runGeneration cps (replicateM 100 genGeralRegistos)
  putStr $ unlines $ filter (/="") $ samples

-- * Estado do Gerador de Logs

-- | Estado do gerador.
data GenState
  = GenState
  { stLocalidades :: [CodigoPostal]
  , stNomes ::  [String]
  , stEmpresa :: [String]
  , stMatricula :: [String]
  , stNum1 :: [String]
  , stNum2 :: [String]
  , stCount :: Int -- Usado na geração de novas empresas para garantir que apenas são criadas 12 que são as que temos definidas no Nomes.hs
  , stLogClientes :: [(String,String)] -- [(Email, Password)] registo de todos os logins dos clientes
  , stLogMotoristas :: [(String, String)] -- [(Email, Password)] registo de todos os logins dos motoristas
  , stLogMotoristasEmpresas :: [(String, String)] -- [(Email, Password)] registo de todos os logins dos motoristas que pertencem a uma determinada empresa
  , stLogEmpresas :: [(String, String)] -- [(Email, Password)] registo de todos os logins das empresas
  , stMotoristasSemVeiculo :: [String] -- Utilizado para registar o email dos condutores para posteriormente adicionar veículos
  }

-- | Estado por pré-definido para o gerado.
defaultGenState :: GenState
defaultGenState
  = GenState
  {
    stLocalidades = []
  , stNomes = []
  , stEmpresa = []
  , stMatricula = []
  , stNum1 = []
  , stNum2 = []
  , stCount = 12
  , stLogClientes = []
  , stLogMotoristas = []
  , stLogMotoristasEmpresas = []
  , stLogEmpresas = []
  , stMotoristasSemVeiculo = []
  }

-- | Tipo do gerador com estado.
type StGen a = StateT GenState Gen a


-- | Executa um gerador com estado.
runGeneration :: [CodigoPostal] -> StGen a -> Gen a
runGeneration localidades g = evalStateT g defaultGenState { stLocalidades = localidades }

runGenerationN :: StGen a -> Gen a
runGenerationN g = evalStateT g defaultGenState


-----------------------------------------------------------------------------------------------------
-- * Geradores --------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

genGeralRegistos :: StGen String
genGeralRegistos = do
  cliente <- genCliente
  condutor <- genCondutor
  condutorEmp <- genCondutorEmp
  empresa <- genEmpresaAux
  matriculas <- genMatriculas
  veiculos <- genVeiculo
  veiculosEmp <- genVeiculoEmpresa
  acaoCliente <- genGeralClientes
  acaoMotorista <- genGeralMotoristas
  return $ cliente ++ "\n" ++ condutor ++ "\n" ++ condutorEmp ++ "\n" ++ empresa ++ "\n" ++ veiculos ++ "\n" ++ acaoCliente ++ "\n" ++ acaoMotorista ++ "\n"

-----------------------------------------------------------------------------------------------------
genGeralClientes :: StGen String
genGeralClientes = do
  login <- genClienteAction
  solicitar1 <- genSolicitar
  return $ login ++ "\n" ++ solicitar1 ++ "\n" ++ "logout ;" ++ "\n"

genSolicitar :: StGen String
genSolicitar = do
  coordenada <- genCoord
  return $ "solicitar " ++ coordenada ++ ";"

genClienteAction :: StGen String
genClienteAction = do
  estado <- get
  clientes <- gets stLogClientes
  let clientesAux = clientes
  cliente <- lift $ elements clientesAux
  let email = fst cliente
  let password = snd cliente
  return $ "login " ++ email ++ " " ++ password ++ ";"
-----------------------------------------------------------------------------------------------------

genGeralMotoristas :: StGen String
genGeralMotoristas = do
  login <- genMotoristaAction
  viagem <- genViagem
  return $ login ++ "\n" ++ viagem ++ "\n" ++ "logout ;" ++ "\n"

genViagem :: StGen String
genViagem = do
  acao <- lift $ elements acoesMotorista
  return $ acao


genMotoristaAction :: StGen String
genMotoristaAction = do
  estado <- get
  motoristas <- gets stLogMotoristas
  let motoristasAux = motoristas
  motorista <- lift $ elements motoristasAux
  let email = fst motorista
  let password = snd motorista
  return $ "login " ++ email ++ " " ++ password ++ ";"

-----------------------------------------------------------------------------------------------------

genVeiculo :: StGen String
genVeiculo = do
  tipo <- lift $ elements listaVeiculos
  estado <- get
  motoristas <- gets stMotoristasSemVeiculo
  motorista <- lift $ elements motoristas
  matriculas <- gets stMatricula
  matricula <- lift $ elements matriculas
  posicao <- genSolicitar
  fiabilidade <- lift $ choose(0::Int,100)
  return $ "registar " ++ tipo  ++ " " ++  matricula ++ show fiabilidade ++ " " ++ motorista ++ " ;"

genVeiculoEmpresa :: StGen String
genVeiculoEmpresa = do
  tipo <- lift $ elements listaVeiculos
  estado <- get
  empresas <- gets stEmpresa
  empresa <- lift $ elements empresas
  matriculas <- gets stMatricula
  matricula <- lift $ elements matriculas
  posicao <- genSolicitar
  fiabilidade <- lift $ choose(0::Int,100)
  return $ "registar "  ++ tipo ++ " " ++ matricula ++ show fiabilidade ++ " empresa " ++ empresa ++ " ;"


-----------------------------------------------------------------------------------------------------
-- * Geradores Auxiliares ---------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

-- GERA NOMES DE UTILIZADORES --

genNome :: StGen String
genNome = do
  estado <- get
  nomes <- gets stNomes
  novoNome <- lift $ (elements listaNomes) `suchThat` (\n -> n `notElem` nomes)
  let newNomes = [novoNome] ++ nomes
  put (estado { stNomes = newNomes} )
  return $ novoNome

  -- gera o nome completo
genNomes :: StGen String
genNomes = do
  nome <- genNome
  apelido <- lift $ elements listaApelidos
  return $ "\"" ++ nome ++ " " ++ apelido ++ "\" "

genEmailUser :: String -> StGen String
genEmailUser n = do
  email <- lift $ elements listaEmails
  return $ "\"" ++ (filter(/='"') n) ++ email ++ "\" "


-- GERA MORADA --

genMorada :: StGen String
genMorada = do
  -- busca a lista de códigos postais
  localidades <- gets stLocalidades
  -- selecciona uma das localidades
  loc <- lift $ elements localidades
  -- gera um número de polícia
  num <- lift $ choose (1::Int, 2500)
  -- retorna uma representação textual da morada
  return $ "\"" ++ cpRua loc ++ ", " ++ show num ++ ", " ++ cpCodigo loc ++ " " ++ cpLocalidade loc ++ "\" "


-- GERA DATA --

genData :: StGen String
genData = do
  m <- lift $ elements listaNumMes
  d <- lift $ elements listaNumDiasF
  y <- lift $ elements [1990..2016]

  --if (m `Elem` [02]) then do
  --  d <- lift $ elements listaNumDiasF else if (m `Elem` [01,03,05,07,08,10,12]) then do
  --    d <- (lift $ elements listaNumDiasF1) else do
  --      d <- (lift $ elements listaNumDiasF0)

  return $ (show y) ++ "-" ++ m ++ "-" ++ d ++ " "

-- GERA COORDENADA --

genCoord :: StGen String
genCoord = do
  x1 <- lift $ choose(0::Int,99)
  y1 <- lift $ choose(0::Int,9)
  x2 <- lift $ choose(0::Int,99)
  y2 <- lift $ choose(0::Int,9)
  return $ "(" ++ (show x1) ++ "." ++ (show y1) ++ ", " ++ (show x2) ++ "." ++ (show y2) ++")"

  -- GERA PASSWORD --

genPassword :: StGen String
genPassword = do
  password <- lift $ vectorOf 8 $ elements "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890"
  return $ "\"" ++ password ++ "\" "


-- GERA EMPRESA NÃO ÚNICA --

genEmp :: StGen String
genEmp = do
  empresa <- lift $ elements listaEmpresas
  return $ "\"" ++ empresa ++ "\" "


-- GERA MATRICULA VEICULO --

genNum :: StGen String
genNum = do
  estado <- get
  emp <- gets stNum1
  novoNum <- lift $ (elements listaNum) `suchThat` (\n -> n `notElem` emp)
  let newNum = [novoNum] ++ emp
  put (estado { stNum1 = newNum} )
  return $ novoNum

-- gera num único
genNum2 :: StGen String
genNum2 = do
  estado <- get
  emp <- gets stNum2
  novoNum <- lift $ (elements listaNum) `suchThat` (\n -> n `notElem` emp)
  let newNum = [novoNum] ++ emp
  put (estado { stNum2 = newNum} )
  return $ novoNum

genMatricula :: StGen String
genMatricula = do
      n1 <- genNum
      n2 <- genNum2
      letra1 <- lift $ elements "QWERTYUIOPASDFGHJKLZXCVBNM"
      letra2 <-  lift $ elements "QWERTYUIOPASDFGHJKLZXCVBNM"
      return $ "\"" ++ n1 ++ "-" ++ [letra1] ++ [letra2] ++  "-" ++ n2 ++"\" "

genMatriculas :: StGen String
genMatriculas = do
  matricula <- genMatricula
  estado <- get
  matriculas <- gets stMatricula
  let novaM = [matricula] ++ matriculas
  put (estado {stMatricula = novaM})
  return $ matricula


-- GERA UTILIZADORES --

genCliente :: StGen String
genCliente = do
  nome <- genNomes
  email <- genEmailUser (filter(/=' ')nome)
  password <- genPassword
  morada <- genMorada
  dataN <- genData
  posicao <- genCoord
  estado <- get
  users <- gets stLogClientes
  let newUser = [(email, password)] ++ users
  put (estado {stLogClientes = newUser})
  return $ "registar cliente " ++ email ++ nome ++ password ++ morada ++ dataN ++ posicao ++ " ;"


-- Gera o registo de um condutor
genCondutor :: StGen String
genCondutor = do
  nome <- genNomes
  email <- genEmailUser (filter(/=' ')nome)
  password <- genPassword
  morada <- genMorada
  dataN <- genData
  fator <- lift $ choose(0::Int,100)
  estado <- get
  users <- gets stLogMotoristas
  let newUser = [(email, password)] ++ users
  emails <- gets stMotoristasSemVeiculo
  let aux = [email] ++ emails
  put (estado { stLogMotoristas = newUser, stMotoristasSemVeiculo = aux})
  return  $ "registar condutor " ++ email ++ nome ++ password ++ morada ++ dataN ++ show(fator) ++ " ;"

-- Gera um condutor de uma empresa
genCondutorEmp :: StGen String
genCondutorEmp = do
  nome <- genNomes
  email <- genEmailUser (filter(/=' ')nome)
  password <- genPassword
  morada <- genMorada
  dataN <- genData
  fator <- lift $ choose(0::Int,100)
  empresa <- genEmp
  estado <- get
  users <- gets stLogMotoristasEmpresas
  let newUser = [(email, password)] ++ users
  put (estado {stLogMotoristasEmpresas = newUser})
  return  $ "registar condutor " ++ email ++ nome ++ password ++ morada ++ dataN ++ show(fator) ++ empresa ++ " ;"

-- gera um registo de empresa única
genEmpresa :: StGen String
genEmpresa = do
  empresa <- genEmpUnica
  password <- genPassword
  estado <- get
  users <- gets stLogEmpresas
  let newUser = [(empresa, password)] ++ users
  put (estado {stLogEmpresas = newUser})
  return $ "registar empresa " ++ empresa ++ password ++ ";"

genEmpresaAux :: StGen String
genEmpresaAux = do
  estado <- get
  counter <- gets stCount
  let num = counter
  if(num > 0) then do
    put (estado {stCount = num - 1})
    genEmpresa
  else do {return $ ""}


-- GERA EMPRESA ÚNICA
genEmpUnica :: StGen String
genEmpUnica = do
  estado <- get
  emp <- gets stEmpresa
  novaEmpresa <- lift $ (elements listaEmpresas) `suchThat` (\n -> n `notElem` emp)
  let newEmpresa = [novaEmpresa] ++ emp
  put (estado { stEmpresa = newEmpresa} )
  return $ "\"" ++ novaEmpresa ++ "\" "

----------------------------------------------------------------------------------------------------------
