grammar ATS;

@header
{
  import java.awt.geom.Point2D;
  import java.time.LocalDate;
  import java.util.*;
  import java.util.HashMap;
  import java.time.LocalDate;
  import java.time.format.DateTimeFormatter;
  import java.lang.Object;

}

@members
{
  UMeR umer = new UMeR();
  LinkedList<Dados> trips = new LinkedList();
  Dados dados = new Dados();

    public class Dados
    {
        private String utilizador;
        private Point2D.Double posicao;


        public Dados()
        {
            this.utilizador = "";
        }

        public Dados(String u, Point2D.Double pos)
        {
            this.utilizador = u;
            this.posicao = pos;
        }

        public String getUser()
        {
            return this.utilizador;
        }

        public Point2D.Double getPos()
        {
            return this.posicao;
        }
    }

  int x;
  private String unquote(String str) {
    return str.substring(1,str.length()-1);
  }
}

/**
 *
 * REGRAS
 *
 */

/** início */

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
         | registarveiculo
         ;

registarcondutor : 'registar condutor' email nome password morada data fatorCump nomeEmpresa?
{
    String strDate = $data.text;
    LocalDate aLD = LocalDate.parse(strDate);
    String rating = $fatorCump.text;
    double value = Double.parseDouble(rating);
    HashMap<String, Driver> drivers = new HashMap<>();

    if($nomeEmpresa.text == null)
    {
        Driver d = new Driver(unquote($email.text), unquote($nome.text), unquote($password.text), unquote($morada.text), aLD, value, null);
        drivers = umer.getAllDrivers();
        drivers.put(d.getEmail(), (Driver) d.clone());
        umer.setAllDrivers(drivers);
        umer.registerUser(d,null);
    }
    else
    {
        Driver d = new Driver(unquote($email.text), unquote($nome.text), unquote($password.text), unquote($morada.text), aLD, value, unquote($nomeEmpresa.text));
        drivers = umer.getDriversP();
        drivers.put(d.getEmail(), (Driver) d.clone());
        umer.setDrivers(drivers);
        umer.registerUser(d, unquote($nomeEmpresa.text));
    }
}
                ;

registarempresa : 'registar empresa' nomeEmpresa password
{
    umer.registerCompany(unquote($nomeEmpresa.text), unquote($password.text));
}
                ;

registarcliente : 'registar cliente' email nome password morada data posicao 
{
    String strDate = $data.text;
    LocalDate aLD = LocalDate.parse(strDate);
    HashMap<String, Client> clients = new HashMap<>();

    clients = umer.getClients();
    Client u = new Client(unquote($email.text), unquote($nome.text), unquote($password.text), unquote($morada.text), aLD);
    clients.put(u.getEmail(), (Client) u.clone());
    umer.setClients(clients);
    umer.registerUser(u, null);
    
}
                ;

registarveiculo : registarcarrinha
                | registarcarro
                | registarmota
                | registarHelicoptero
                ;

registarcarrinha : 'registar carrinha' matricula fiabilidade posicao dono 
                {
                    double reliable = Double.parseDouble($fiabilidade.text);
                    Van v = new Van(unquote($matricula.text), reliable, $posicao.pos, unquote($dono.text));
                    umer.registerVehicleP(v);
                }
                 | 'registar carrinha' matricula fiabilidade posicao 'empresa' nomeEmpresa
                 {
                    double reliable = Double.parseDouble($fiabilidade.text);
                    Van v = new Van(unquote($matricula.text), reliable, $posicao.pos, unquote($nomeEmpresa.text));
                    umer.registerCompanyVehicle(unquote($nomeEmpresa.text),v);
                 }
                 ; 

registarcarro: 'registar carro' matricula fiabilidade posicao dono
                {
                    double reliable = Double.parseDouble($fiabilidade.text);
                    Car v = new Car(unquote($matricula.text), reliable, $posicao.pos, unquote($dono.text));
                    umer.registerVehicleP(v);
                }
             | 'registar carro' matricula fiabilidade posicao 'empresa' nomeEmpresa
              {
                    double reliable = Double.parseDouble($fiabilidade.text);
                    Car v = new Car(unquote($matricula.text), reliable, $posicao.pos, unquote($nomeEmpresa.text));
                    umer.registerCompanyVehicle(unquote($nomeEmpresa.text),v);
                }
             ;

registarmota: 'registar mota' matricula fiabilidade posicao dono
                {
                    double reliable = Double.parseDouble($fiabilidade.text);
                    Bike v = new Bike(unquote($matricula.text), reliable, $posicao.pos, unquote($dono.text));
                    umer.registerVehicleP(v);
                }
            | 'registar mota' matricula fiabilidade posicao 'empresa' nomeEmpresa
                {
                    double reliable = Double.parseDouble($fiabilidade.text);
                    Bike v = new Bike(unquote($matricula.text), reliable, $posicao.pos, unquote($nomeEmpresa.text));
                    umer.registerCompanyVehicle($nomeEmpresa.text,v);
                }
            ;

registarHelicoptero: 'registar helicoptero' matricula fiabilidade posicao dono
                {
                    double reliable = Double.parseDouble($fiabilidade.text);
                    Helicopter v = new Helicopter(unquote($matricula.text), reliable, $posicao.pos, unquote($dono.text));
                    umer.registerVehicleP(v);
                } 
                | 'registar helicoptero' matricula fiabilidade posicao 'empresa' nomeEmpresa
                {
                    double reliable = Double.parseDouble($fiabilidade.text);
                     
                    Helicopter v = new Helicopter(unquote($matricula.text), reliable, $posicao.pos, unquote($nomeEmpresa.text));
                    umer.registerCompanyVehicle(unquote($nomeEmpresa.text),v);
                }
                ;

sessao : login
       | logout;

login : 'login' email password
    {
        User user = umer.allUsers().get(unquote($email.text));
        umer.loginUser(unquote($email.text), unquote($password.text));
        umer.setCurrent_user(unquote($email.text));
    }
    ;


logout : 'logout'
    {
        umer.setCurrent_user(null);
    }
    ;


solicitar : 'solicitar' posicao
    {
        /*  No Solicitar adicionamos a viagem à LinkedList da gramática (no fim da lista) FIFO 
         */

        String email = umer.getCurrent_user();

        if (umer.getClients().containsKey(email))
        {
            Dados d = new Dados(email,$posicao.pos);
            trips.addLast(d);
        }

    }
    ;

viajar : 'viajar'
    {

         /* Aqui no viajar vamos buscar a viagem à LinkedList que temos na gramática  
          * Adicionamos à Umer e invocamos o método doTripQueue para executar a viagem
          */

        String email = umer.getCurrent_user();
        if(trips.size() > 0)
        {
            Dados v = trips.getFirst(); // vai buscar o primeiro elemento da lista FIFO
    
            if(v!=null)
            {
                String cl = v.getUser();
                Client cliente = umer.getClients().get(cl);
                String taxi = umer.closestAvailableTaxi(cliente);

                if(umer.getAllVehicles().containsKey(taxi)){
                    Trip t= umer.newTripClosest(cliente, v.getPos());

                    Driver driver = umer.getAllDrivers().get(t.getDriver());

                    umer.addTrip(cl, driver.getEmail(), taxi, t);
                    umer.addRating(driver.getEmail(),t.getRating(),t.getID());
                }
                else
                {
                    if(umer.getVehiclesP().containsKey(taxi))
                    {

                     Trip t= umer.newTripClosest(cliente, v.getPos());

                     Driver driver = umer.getAllDrivers().get(t.getDriver());

                     umer.addTrip(cl, driver.getEmail(), taxi, t);
                     umer.addRating(driver.getEmail(),t.getRating(),t.getID());

                    }
                    else
                    {
                        umer.setTeste("Veículo não existe"); 
                    }
                }

            }
        }
    }
    ;

recusarviagem : 'recusar viagem' 
    {
        /*  No recusar viagem estou apenas a apagar o primeiro elemento da lista ligada
         *  A viagem, sendo aqui recusada não está no UMER. Só é adicionada ao UMeR no viajar,
         * ou seja, se a viagem for realizada
         */

        String email = umer.getCurrent_user();
        if (umer.getDriversP().containsKey(email))
        {
            if(trips.size() > 0)
            {
                Dados v = trips.getFirst();
                trips.remove(v);
            }
        }
    }
    ;

posicao returns [Point2D.Double pos] : '(' coordx ',' coordy')'
           {
              double xi = Double.parseDouble($coordx.text);
              double yi = Double.parseDouble($coordy.text);
              Point2D.Double po = new Point2D.Double(xi,yi);
              $pos = po; 
           };

data : DATA;

morada : STRING;

nome : STRING;

nomeEmpresa : STRING;

password : STRING;

fatorCump : DIGIT+;

email : STRING;

fiabilidade: DIGIT+;

dono: STRING;

matricula: STRING;

coordx: COORD;

coordy: COORD;

/**
 *
 * TOKENS
 *
 */

/** uma string entre aspas */
STRING : '"' (~[\\"] | '\\' [\\"])* '"' ;

CHAR : [A-Z];

/** data no formato YYYY-MM-DD */
DATA : DIGIT DIGIT DIGIT DIGIT '-' DIGIT? DIGIT '-' DIGIT? DIGIT ;

/** coordenadas */
COORD: DIGIT DIGIT? '.' DIGIT;

/** dígito */
DIGIT : [0-9] ;

/** espaço em branco (que é ignorado) */
WS : [ \t\r\n]+ -> skip ;