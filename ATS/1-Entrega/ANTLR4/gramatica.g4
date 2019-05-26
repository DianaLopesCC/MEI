grammar teste;

log: (acao ';')+ 
 ;

acao : registar 
     | sessao
     | solicitar
     | viajar
     | recusarviagem;

registar : registarcondutor 
         | registarempresa 
         | registarcliente
         ;

registarcondutor : 'registar condutor' Email  Nome Password Morada DATA FatorCump
                | 'registar condutor' Email Nome Password Morada DATA NomeEmpresa
                ;

registarempresa : 'registar empresa' NomeEmpresa Password
                ;

registarcliente : 'registar cliente' Email Nome Password DATA Posicao
                ; 

sessao : Login
       | Logout;

Login : 'login' Email Password ;
Logout : 'logout' ;


solicitar : 'solicitar' Posicao; 

viajar : 'viajar';

recusarviagem : 'recusar viagem';

Posicao : '(' COORD ',' COORD ')';

Morada : STRING;

Nome : STRING;

NomeEmpresa : STRING;

Password : STRING;

FatorCump : DIGIT;

Email : STRING;

/** uma string entre aspas */
STRING : '"' (~[\\"] | '\\' [\\"])* '"' ;



/** data no formato YYYY-MM-DD */
DATA : DIGIT DIGIT DIGIT DIGIT '-' DIGIT? DIGIT '-' DIGIT? DIGIT ;

/** dígito */
DIGIT : [0-9] ;

/** coordenada */
COORD : DIGIT DIGIT '.' DIGIT ;

/** espaço em branco (que é ignorado) */
WS : [ \t\r\n]+ -> skip ;

/** Vale tudo */
TEXTO : (('\''|'\"') ~('\''|'\"')* ('\''|'\"'));