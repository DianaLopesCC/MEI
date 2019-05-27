module Nomes
  ( NomeUser (..)
  , NomeEmpresa (..)
  , listaApelidos
  , listaNomes
  , listaEmpresas
  , listaEmails
  , nomesTeste
  , apelidosTeste
  , listaNum
  , listaNumDiasF
  , listaNumDiasF1
  , listaNumDiasF0
  , listaNumMes
  , listaVeiculos
  , acoesMotorista
  ) where

import Utils

import Data.List

data NomeUser
  = NomeUser
  { nomeP   :: String
  , apelido :: String
  } deriving (Show)

data NomeEmpresa
  = NomeEmpresa {nomeE :: String}
  deriving (Show)

listaVeiculos :: [String]
listaVeiculos = ["carro","mota","helicoptero","carrinha"]

listaEmails :: [String]
listaEmails =
  ["@gmail.com","@sapo.pt","@mail.google","@hotmail.com","@outlook.com"]

listaApelidos :: [String]
listaApelidos =
  ["Silva","Santos","Ferreira","Pereira","Oliveira","Costa"
  ,"Rodrigues","Martins","Jesus","Sousa","Fernandes","Goncalves"
  ,"Gomes","Lopes","Marques","Alves","Almeida","Ribeiro","Pinto"
  ,"Carvalho","Teixeira","Moreira","Correia","Mendes","Nunes"
  ,"Soares","Vieira","Monteiro","Cardoso","Rocha","Raposo","Neves"
  ,"Coelho","Cruz","Cunha","Pires","Ramos","Reis","Simoes"
  ,"Antunes","Matos","Fonseca","Machado","Araujo","Barbosa"
  ,"Tavares","Lourenco","Castro","Figueiredo","Azevedo","Freitas"
  ,"Magalhaes","Henriques","Lima","Guerreiro","Batista","Pinheiro"
  ,"Faria","Miranda","Barros","Morais","Nogueira","Esteves","Anjos"
  ,"Baptista","Campos","Mota","Andrade","Brito","Sa","Nascimento"
  ,"Leite","Abreu","Borges","Melo","Vaz","Pinho","Vicente"
  ,"Gaspar","Assuncao","Maia","Moura","Valente","Domingues"
  ,"Garcia","Carneiro","Loureiro","Neto","Amaral","Branco","Leal"
  ,"Pacheco","Macedo","Paiva","Matias","Amorim","Torres"
  ]

acoesMotorista :: [String]
acoesMotorista = ["viajar ;","recusar viagem ;"]

apelidosTeste :: [String]
apelidosTeste =
  ["Silva","Santos","Ferreira","Pereira","Oliveira"]

nomesTeste :: [String]
nomesTeste =
  ["Aarao","Abdenago","Abdul","Abel","Abelamio"]

listaNomes :: [String]
listaNomes =
  ["Aarao","Abdenago","Abdul","Abel","Abelamio","Abelardo","Abigail"
  ,"Abilio","Abna","Abraao","Abraim","Abrao","Absalao","Acacio"
  ,"acil","Acilino","Acilio","Acucena","Acursio","Ada","Adail"
  ,"Adalberto","Adalgisa","Adalia","Adalsindo","Adalsino","Adamantino","Adamastor"
  ,"Adao","Adelaide","Adelia","Adelio","Adelindo","Adelina","Adelmo"
  ,"Ademar","Adeodato","Aderio","Aderito","Adiel","adila","Adilia"
  ,"Adilio","Adner","Adolfo","Adonai","Adonias","Adonilo","Adonis"
  ,"Adorino","Adosinda","Adriana","Adriano","Adriel","Adrien","Adrualdo"
  ,"Adruzilo","Afonsino","Afonsina","Afonso","Afra","Afranio","Afre"
  ,"Africana","Africano","agata","Agenor","Agna","Agnelo","Agnes"
  ,"Agostinho","agueda","Aida","Aide","Aires","Airiza","Airton"
  ,"Aitor","Aisha","Aladino","Alaide","Alamiro","Alan","Alana"
  ,"Alano","Alao","Alba","Albano","Alberico","Alberta","Albertina"
  ,"Alberto","Alcibiades","Alcides","Alcina","Alcindo","Alcino","Alcione"
  ,"Aldair","Aldara","Aldemar","Aldenir","Aldenora","Alder","Aldo"
  ,"Aldo","Aldonio","Aldora","Alegria","Aleixa","Aleta","Aleu"
  ,"Alex","Alexa","Alexandra","Alexandre","Alexandrina","Alexandrino","Alexandro"
  ,"Alexia","Alexina","Alexio","Alexis","Alfeu","Alfreda","alia"
  ,"Aliana","Alica","Alice","Alicia","Alida","Alina","Aline"
  ,"Alipio","Alirio","Alisande","alison","Alita","Alitio","Alito"
  ,"Alivar","Alix","Alma","Almara","Almesinda","Almira","Almiro"
  ,"Alois","Aloisio","Alpoim","Altina","Altino","Alva","Alvarim"
  ,"Alvarina","Alvarino","Alvario","alvaro","Alvino","Alzira","Amadeu"
  ,"Amadis","Amado","Amador","Amalia","Amanda","Amandina","Amara"
  ,"Amarildo","Amarilio","Amarilis","Amaro","Amauri","Amavel","Amelia"
  ,"Amelina","America","Americo","Aminadabe","Amor","Amora","Amorim"
  ,"Amorina","Amorzinda","Amos","Ana","Anabel","Anabela","Anael"
  ,"Anaice","Anaide","Anaim","Anair","Anais","Anaisa","Anaisa"
  ,"Analdina","Analia","Analice","Analide","Analisa","Anamar","Anania"
  ,"Ananias","Anas","Anatilde","Andre","Andrea","Andreia","Andreas"
  ,"Andreina","Andrelina","Andreo","Andres","Andresa","Andria","Aneide"
  ,"Anesia","Anfilito","Anfiloco","Angel","Angela","Angelica","Angelico"
  ,"Angelina","Angelita","Angelo","Ania","Aniana","Anicia","Anielo"
  ,"Aniria","Anisia","Anisio","Anita","Anolido","Anquita","Anselmo"
  ,"Anteia","Antelmo","Antera","Antero","Antonela","Antonelo","Antonia"
  ,"Antonieta","Antonina","Antonio","Anunciacao","Anunciada","Anuque","Anusca"
  ,"Aparecida","Aparicio","apio","Apolinario","Apolo","Aprigio","Aquil"
  ,"Aquila","aquila","Aquiles","Aquilino","Aquira","Arabela","Araci"
  ,"Aradna","Aramis","Arao","Arcadio","Arcanjo","Arcelino","Arcelio"
  ,"Arcilio","Ardingue","Argemiro","Argentina","Argentino","Ari","aria"
  ,"Ariadna","Ariadne","Ariana","Ariane","Ariel","Ariele","Arinda"
  ,"Arine","Ariosto","Arisberto","Aristides","Aristoteles","Arlanda","Arlete"
  ,"Armandina","Armandino","Armando","Armelim","Armenia","Armenio","Armindo"
  ,"Aron","Arquimedes","Arquiminio","Arquimino","Arsenio","Artemisa","Artemisia"
  ,"Artur","Aruna","Ary","Ascenso","Aselio","aser","asia"
  ,"Assis","Assuncao","Assunta","Astrid","Astride","Ataide","Atanasio"
  ,"Atao","Atenais","atila","atina","Aubri","Audete","Aura"
  ,"aurea","Aurelia","Aureliana","aureo","Aurete","Auriana","Ausenda"
  ,"Ausendo","Austrelino","Auta","Auxilia","Ava","Avelino","Aventino"
  ,"Axel","Azelio","Aziz","Azuil","Baldemar","Baldomero","Banduino"
  ,"Baltasar","Baqui","Barac","Barao","Barbara","Barbora","Barcino"
  ,"Bartolina","Bartolomeu","Basilia","Basilio","Basilissa","Bastiao","Batista"
  ,"Beanina","Beatriz","Bebiana","Bebiano","Bela","Belchior","Belem"
  ,"Belina","Belinda","Belisa","Bendavida","Benedita","Benedito","Benevenuto"
  ,"Benicia","Benicio","Benigna","Benilde","Benita","Benjamim","Benjamina"
  ,"Bento","Benvinda","Berardo","Berengaria","Berilo","Bernadete","Bernardete"
  ,"Bernardim","Bernardina","Bernardino","Bernardo","Bernia","Bertila","Bertilde"
  ,"Bertina","Bertino","Berto","Bertolino","Betania","Betia","Betina"
  ,"Betino","Beto","Betsabe","Bia","Biana","Bianca","Bianor"
  ,"Bibiana","Bibili","Bijal","Bina","Bitia","Blandina","Blasia"
  ,"Boanerges","Boavida","Boris","Branca","Brandao","Bras","Brasia"
  ,"Braulio","Brazia","Brena","Brenda","Breno","Brian","Briana"
  ,"Bricia","Brigida","Brigido","Brigite","Briolanjo","Briosa","Brites"
  ,"Brizida","Bruce","Bruna","Bruno","Brunilde","Bryan","Cassia"
  ,"Cael","Caetana","Caetano","Caia","Caico","Caio","Caleb"
  ,"Calila","Calisto","Camelia","Camila","Candice","Candido","Cania"
  ,"Canto","CapitolinaAntonio","Carela","Caren","Carin","Carina","Carisa"
  ,"Carisia","Carissa","Carita","Carla","Carlinda","Carlo","Carlos"
  ,"Carlota","Carmelia","Carmelina","Carmelinda","Carmelita","Carmen","Carmerio"
  ,"Carmezinda","Carmim","Carmina","Carminda","Carminho","Carmo","Carmorinda"
  ,"Carol","Carole","Carolina","Carsta","Cassandra","Cassia","Cassiano"
  ,"Cassilda","Cassio","Casta","Castelina","Castelino","Castor","Castorina"
  ,"Catalina","Catarina","Catarino","Caterina","Catia","Catila","Catilina"
  ,"Cecilia","Cedrico","Celia","Celina","Celinia","Celino","Celio"
  ,"Celisio","Celsa","Celsio","Celso","Celto","Ceres","Cesaltina"
  ,"Cesaria","Cesarina","Cesario","Cesaro","Chantal","Charbel","Cheila"
  ,"Chema","Chloe","Cibele","Cicero","Cid","Cidalia","Cidalina"
  ,"Cidalio","Cidalisa","Cildo","Cilia","Cilio","Cinara","Cinara"
  ,"Cinderela","Cinira","Cintia","Cipora","Circe","Ciria","Cirila"
  ,"Cirilo","Ciro","Cita","Cizina","Clara","Clarina","Clarinda"
  ,"Clarindo","Clarinha","Clarisse","Claudemira","Claudemiro","Claudia","Claudiana"
  ,"Claudiano","Claudio","Cleia","Cleide","Clelia","Clelio","Clemencia"
  ,"Cleodice","Cleonice","Cleopatra","Clesia","Clesio","Clicia","Clicio"
  ,"Clidio","Clife","Climenia","Clivia","Cloe","Cloe","Clorinda"
  ,"Clorindo","Clovis","Colete","Conceicao","Concha","Consolacao","Constanca"
  ,"Constancia","Constancio","Consulino","Cora","Coralia","Coralio","Cordelia"
  ,"Corina","Corino","Corita","Corito","Corsino","Cosete","Cosme"
  ,"Cremilda","Cremilde","Crestila","Crisalia","Crisalida","Crisanta","Crisante"
  ,"Crispim","Cristela","Cristele","Cristene","Cristiana","Cristiano","Cristina"
  ,"Cristofe","Cristoforo","Cristolinda","Cristovao","Cursino","Dacia","Dacio"
  ,"Dafne","Dagmar","Dagoberto","Daina","Daisi","Dalia","Daliana"
  ,"Dalida","Dalila","Dalinda","Dalva","Damaris","Damas","Damiao"
  ,"Damien","Dana","Dania","Daniana","Dariana","Daniel","Daniela"
  ,"Danila","Danilo","Dante","Dara","Darcilia","Darcio","Dario"
  ,"Dario","Darlene","Darnela","Darque","Davi","David","Davide"
  ,"Davina","Davinia","Debora","Decia","Decimo","Deise","Deivid"
  ,"Dejalme","Dejanira","Delcio","Dele","Delfim","Delfino","Delia"
  ,"Deliana","Delio","Delisa","Delmano","Delmar","Delmina","Delmina"
  ,"Delminda","Delmira","Delmiro","Demelza","Demeter","Demetria","Demetrio"
  ,"Dener","Denil","Denis","Denisa","Denise","Deodata","Deodete"
  ,"Deolindo","Deonilde","Deotila","Deotila","Dercio","Derocila","Deusdedito"
  ,"Dhruva","Dialina","Diamantina","Diamantino","Diana","Didaco","Didia"
  ,"Didiana","Diego","Dieter","Digna","Digno","Dilan","Dilermando"
  ,"Diliana","Dilsa","Dimas","Dina","Dina","Dinamene","Dinarda"
  ,"Dinarta","Dinarte","Dineia","Dinis","Dino","Dinora","Dioclecia"
  ,"Diocleciana","Diocleciano","Dioclecio","Diogo","Diomar","Dione","Dionilde"
  ,"Dionisia","Dionisio","Dioniso","Dionisodoro","Dirce","Dircea","Dircila"
  ,"Dirio","Dirque","Disa","Ditza","Diva","Divo","Diza"
  ,"Djalma","Djalme","Djalmo","Djamila","Dolique","Dolores","Domingas"
  ,"Domingos","Dominico","Domitila","Domitilia","Domitilo","Donaldo","Donatila"
  ,"Donato","Donzelia","Donzilia","Donzilio","Dora","Dorabela","Doralice"
  ,"Doriana","Doriclo","Dorina","Dorinda","Dorindo","Dorine","Dorino"
  ,"Doris","Dorisa","Dositeu","Drusila","Druso","Duarte","Duartina"
  ,"Duilio","Dulce","Dulcelina","Dulcidia","Dulcina","Dulcineia","Dulcinio"
  ,"Dulia","Dunia","Dunio","Durbalino","Durval","Durvalina","Durvalino"
  ,"Earine","Eberardo","Eda","Eder","eder","Ederia","Edgar"
  ,"edi","Edina","Edine","edipo","Edir","Edite","Edith"
  ,"Edma","Edmero","Edmur","Edna","Edo","Eduarda","Eduardo"
  ,"Eduartino","Eduina","Eduino","Edvino","Egidio","Egil","Eglantina"
  ,"Eladio","Elana","Elca","Elda","Eleazar","Electra","Eleia"
  ,"Eleine","Elena","Eleonor","Eleonora","Eleuterio","Elgar","Eli"
  ,"elia","Eliab","Eliana","Eliane","Eliano","Elias","Elicia"
  ,"Eliete","Eliezer","elin","Elina","Eline","elio","Elioenai"
  ,"Elisa","Elisabeta","Elisabete","Elisabeth","Elisama","Eliseba","Elisete"
  ,"Eliseu","Elisia","Elisiario","Elma","Elmano","Elmar","Elmer"
  ,"Elmira","Eloa","Elodia","Elodia","Eloi","Eloisa","Elpidio"
  ,"Elsa","Elsinda","elsio","elson","elton","Eluina","Elva"
  ,"Elvina","Elvino","Elza","Elzeario","Elzo","Ema","Emanuel"
  ,"Emanuela","Emaus","Emidia","Emidio","Emilia","Emiliana","Emo"
  ,"Encarnacao","Eneias","Enes","Engelecia","Engracio","enia","Enide"
  ,"Enilda","enio","Enoque","Enrique","Enzo","eola","Eponina"
  ,"Ercilia","Ercilio","Eric","Erica","erica","Erico","erico"
  ,"Erik","Erika","Erique","eris","Ermeria","Ermiterio","Ernani"
  ,"Esau","Esmeralda","Esmeraldo","Esmeria","Especiosa","Esperanca","Estanislau"
  ,"Estefana","Estefania","Estefano","Estela","Estelio","Ester","Estevao"
  ,"Estrela","Etel","etel","Etelca","Eteria","Eudo","Eudora"
  ,"Eufemia","Eularina","Eulogio","Eunice","Eurica","Eurico","Euridice"
  ,"Eustacio","Eutalia","Eva","Evaldo","Evandra","Evandro","Evangelino"
  ,"Evangelista","Evelacio","Evelasio","Evelina","Eveline","Evelio","Evencio"
  ,"Everaldo","Everardo","evila","Expedito","Ezequiel","Ezequiela","EDNEY"
  ,"Fabia","Fabiana","Fabiano","Fabiao","Fabio","Fabiola","Fabricia"
  ,"Fabricio","Falco","Fani","Fania","Fantina","Fara","Farida"
  ,"Fatima","Faustino","Fausto","Feba","Febe","Fedora","Fedra"
  ,"Felicia","Feliciana","Felicidade","Felicissimo","Felisbela","Felisbina","Felismina"
  ,"Felix","Feliz","Ferdinando","Fernandina","Fernandino","Fernando","Fernao"
  ,"Ferrer","Fiama","Fidelia","Fidelio","Filemon","Filena","Filino"
  ,"Filinto","Filipa","FilipeouFelipe","Filipo","Filomena","Filomeno","Filoteu"
  ,"Fiona","Firmino","Firmo","Flaminia","Flavia","Flavio","Flor"
  ,"Flora","Florbela","Florenca","Florencia","Florentino","Floria","Floriana"
  ,"Floripes","Florisa","Florisbela","Florival","Fradique","Francilia","Francina"
  ,"Francisca","Francisco","Franclim","Franco","Franklim","Franklin","Franklino"
  ,"Fred","Frede","Frederica","Frederico","Fredo","Fulvio","Gabi"
  ,"Gabinia","Gabinio","Gabino","Gabriel","Gabriela","Gaela","Gaele"
  ,"Gaia","Gail","Gala","Galiana","Galiano","Galileu","Gamaliel"
  ,"Gaori","Gaorii","Garcia","Gardela","Garibaldo","Gaspar","Gastao"
  ,"Gavio","Gedeao","Geisa","Genciana","Genesia","Genesio","Gentil"
  ,"Georgeta","Georgete","Georgia","Georgina","Georgino","Geralda","Geraldina"
  ,"Geraldino","Geraldo","Gerberta","Gerberto","Gerda","Germana","Germano"
  ,"Gersao","Gerson","Gerta","Gertrudes","Gervasia","Gervasio","Giana"
  ,"Giani","Giulia","Gil","Gilberta","Gilda","Gildasio","Gildo"
  ,"Gileade","Gilma","Gilmeno","Gina","Ginestal","Gino","Gioconda"
  ,"Giovana","Giovani","Giraldina","Girel","Gisela","Giselda","Gisete"
  ,"Gislena","Gislene","Glaucia","Glenda","Glicinia","Gloriosa","Goma"
  ,"Gomes","Goncala","Goncalo","Gonzaga","Goreti","Graca","Gracia"
  ,"Graciana","Graciano","Graciela","Graciete","Graciliana","Graciliano","Gracinda"
  ,"Gracio","Graciosa","Gravelina","Gregoria","Gregorio","Greta","Grimanesa"
  ,"Guadalupe","Gualdim","Gualter","Gueir","Guendolina","Gui","Guida"
  ,"Guido","Guilherme","Guimar","Guislena","Guislene","Gumersinda","Gumersindo"
  ,"Gumesindo","Gusmao","Gustavo","Guterre","Habacuc","Habacuque","Hadassa"
  ,"Haide","Halia","Hamilton","Haraldo","Harolda","Haroldo","Hazael"
  ,"Hebe","Heber","Heda","Hedila","Hedviges","Heitor","Helada"
  ,"Helade","Heladia","Heladio","Helda","Heldemaro","Helder","Heldo"
  ,"Helena","Helenico","Heleno","Helga","Heli","Helia","Heliana"
  ,"Helier","Helio","Heliodora","Heliodoro","Helmut","Heloisa","Helvecia"
  ,"Helvecio","Helvia","Helvio","Hemexi","Hemeteria","Hemeterio","Hemiteria"
  ,"Hemiterio","Henoch","Henrique","Henriqueta","Heralda","Heraldo","Herberta"
  ,"Herberto","Herculana","Herculano","Heredio","Herenia","Herenio","Heriberta"
  ,"Heriberto","Herlander","Herman","Hermana","Hermania","Hermano","Hermenegilda"
  ,"Hermenegildo","Hermenerica","Hermenerico","Hermes","Herminia","Herminio","Hermiterio"
  ,"Hernani","Hersilia","Hersilio","Herve","Higina","Higino","Hilaria"
  ,"Hilario","Hildeberta","Hildeberto","Hildebrando","Hildegarda","Hildegardo","Hilma"
  ,"Hipolita","Hipolito","Hirondino","Holger","Homero","Honorata","Honorato"
  ,"Honorina","Honorino","Horacia","Horacio","Hortense","Hortensia","Hortensio"
  ,"Hugo","Huguete","Hulda","Iag","Iago","Ian","Iana"
  ,"Ianis","Iara","Iasmin","Iasmina","Iberico","Iberina","icaro"
  ,"Ida","iddy","Idalia","Idalina","Idalio","Idario","Idavide"
  ,"Idelia","Idelso","Idilia","Idrisse","Igelcemina","Ignez","Igor"
  ,"Ilca","Ilda","Ildo","Ilidia","Ilidio","Ilsa","Ilse"
  ,"Ilundi","Ima","Indalecio","Indaleta","India","Indira","Indro"
  ,"Ines","Infante","Inga","Ingeburga","Ingo","Ingrid","Ingride"
  ,"Ingue","Inocencia","Inocencio","Inoi","Io","Iolanda","Ionara"
  ,"Ione","Ioque","Iracema","Irais","Ireneia","Iria","Iriana"
  ,"Irina","Irineu","iris","Irisalva","Irma","Irmino","Isa"
  ,"Isaac","Isabel","Isabela","Isabelina","Isac","Isadora","Isael"
  ,"Isai","Isalda","Isalia","Isalina","Isandro","Isaque","Isaura"
  ,"Isaurinda","Isauro","Isidoro","Isidro","Isilda","Isildo","Isis"
  ,"Ismael","Ismalia","Isolda","Isolete","Isolina","Isolino","Israel"
  ,"Italo","Iuri","Iva","Ivan","Ivana","Ivania","Ivanoel"
  ,"Ivanoela","Iven","Ivete","Ivo","Ivone","Izalino","Jabes"
  ,"Jabim","Jacira","Jaco","Jacob","Jacobina","Jacome","Jacqueline"
  ,"Jader","Jadir","Jael","Jaime","Jair","Jairo","Jalmira"
  ,"James","Jamila","Jamilia","Jamim","Janai","Janaina","Janardo"
  ,"Jandira","Janete","Jani","Jania","Janice","Janina","Janine"
  ,"Janique","Jansenio","Januario","Jaque","Jaquelina","Jaqueline","Jaques"
  ,"Jarbas","Jardel","Jasao","Jasmim","Jasmina","Jeanete","Jeni"
  ,"Jenifer","Jeronimo","Jerusa","Jesse","Jessica","Jesualdo","Jesus"
  ,"Jetro","Jezabel","Jil","Jitendra","Jo","Joab","Joabe"
  ,"Joana","Joaninha","Joao","Joaquim","Joas","Job","Jocelina"
  ,"Jocelino","Jociano","Joel","Joela","Joele","Joelma","Jofre"
  ,"Joice","Jonas","Jonata","Jonatas","Joni","Joraci","Jordana"
  ,"Jordano","Jordao","Jorge","Jorgina","Jorio","Jorja","Josabete"
  ,"Josafat","Josana","Joscelina","Joscelino","Jose","Josefa","Josefa"
  ,"Josefina","Josefo","Joselene","Joselia","Joselina","Joselindo","Joselino"
  ,"Josete","Josiana","Josiane","Josias","Josina","Josivania","Josselina"
  ,"Josselino","Josuana","Josue","Jovelina","Jovelino","Jovito","Juda"
  ,"Judas","Juliana","Juliano","Juliao","Julinda","Julio","Julita"
  ,"Juna","Junia","Junio","Juno","Juraci","Jussara","Juvenal"
  ,"Juventino","Karen","Karina","Katarina","Katia","Katie","Kelly"
  ,"Kevin","Kyara","kevin","Laercio","Laertes","Laila","Laira"
  ,"Lais","Lana","Lara","Larissa","Laura","Laureana","Laureano"
  ,"Laurenio","Laurentino","Lauriano","Laurina","Laurinda","Laurine","Lauro"
  ,"Lavinia","Lazaro","Lea","Leao","Leal","Leandra","Leandro"
  ,"Leanor","Leccio","Lecio","Leena","Leila","Lelia","Lemuel"
  ,"Lenia","Lenio","Lenira","Leo","Leoberto","Leocadia","Leolina"
  ,"Leomenia","Leonardina","Leonardo","Leoncio","Leone","Leonel","Leonete"
  ,"Leonia","Leonicio","Leonida","Leonidia","Leonidio","Leonila","Leonilda"
  ,"Leonilde","Leonilia","Leonisa","Leonor","Leonora","Leontina","Leta"
  ,"Leticia","Letizia","Levi","Levina","Lhuzie","Lia","Liana"
  ,"Liane","Lianor","Liara","Liberal","Liberalina","Liberdade","Liberia"
  ,"Libertaria","Libertario","Liberto","Libia","Lici","Licia","Licidas"
  ,"Licinia","Liciniano","Licinio","Licio","Lidia","Lidiana","Lidio"
  ,"Lidorio","Liduina","Liete","Ligia","Ligio","Lila","Lila"
  ,"Lilia","Lilian","Liliana","Liliane","Liliano","Liliete","Lilite"
  ,"Lina","Linda","Lindorfo","Lindoro","Lineia","Linete","Lineu"
  ,"Lino","Linton","Lira","Lis","Lisa","Lisana","Lisandra"
  ,"Lisandro","Lisdalia","Liseta","Lisete","Lisuarte","Lito","Livia"
  ,"Liz","Lizelia","Lizi","Lizie","Loela","Loide","Lolia"
  ,"Lopo","Loredana","Lorena","Lorenzo","Loreta","Lorina","Lorine"
  ,"Lorival","Lourenca","Lourenco","Lourival","Lua","Luamar","Luana"
  ,"Lubelia","Luca","Lucas","Lucelia","Lucelinda","Lucena","Lucete"
  ,"Lucia","Lucialina","Luciana","Lucileine","Lucilia","Lucilina","Lucilio"
  ,"Lucina","Lucinio","Lucio","Luciola","Ludgero","Ludmila","Ludovico"
  ,"Ludovino","Luela","Luena","Luis","Luisa","Luisete","Luizete"
  ,"Lumena","Luna","Lurdes","Lurdite","Lusa","Lussinga","Lutero"
  ,"Lutgarda","Luz","Luzia","Luzinira","Luzio","Lyannii","Lyonce"
  ,"Madalena","Mafalda","Magali","Magda","Mamede","Manel","Manuel"
  ,"Manuela","Mara","Marcia","Marcilene","Marcio","Margarida","Marco"
  ,"Marcos","Marcela","Marcelo","Marcolina","Margarida","Maria","Mariana"
  ,"Mariano","Marilda","Marilia","Marina","Mario","Marisa","Marlene"
  ,"Marli","Marta","Martim","Martinho","Mateus","Matias","Matilda"
  ,"Mauricio","Maura","Mauro","Maxima","Maximo","Maximiliano","Maximino"
  ,"Mecia","Melania","Melinda","Melissa","Melquisedeque","Mem","Mercedes"
  ,"Merrelho","Miguel","Miguelina","Milena","Mileide","Milu","Micael"
  ,"Micaela","Michele","Minervina","Miriam","Moacir","Moises","Monica"
  ,"Morgana","Murilo","Miru","Nadia","Nadine","Nair","Napoleao"
  ,"Natacha","Natalia","Natalina","Natercia","Natividade","Nazare","Nelson"
  ,"Nestor","Neusa","Neuza","Nelia","Nicanor","Nicolas","Nicolau"
  ,"Nidia","Nilza","Nivaldo","Noa","Noah","Noe","Noel"
  ,"Noemia","Norberto","Normando","Nuno","Nuria","Octavio","Octavia"
  ,"Odete","Odilia","Ofelia","Olavo","Olivia","Olivio","Oliveira"
  ,"Olga","Omar","Ondina","Ordonho","Orestes","Oriana","Otilia"
  ,"oscar","Orlando","Osorio","Osvaldo","Ovidio","Paloma","Palmira"
  ,"Palmiro","Pandora","Parcidio","Parias","Pascoal","Poliana","Patricia"
  ,"Patricio","Paulina","Paulino","Paula","Paulo","Paulino","Pedro"
  ,"Petra","Penelope","Pepio","Piedade","Placido","Plinio","Polibio"
  ,"Polibe","Porfirio","Priao","Priscila","Quaiela","Quar","Queli"
  ,"Quelia","Querubim","Quezia","Quevin","Quiliano","Quim","Quintino"
  ,"Quirilo","Quirina","Quirino","Quirio","Quiteria","Quiterio","Rafael"
  ,"Rafaelo","Rafaela","Ramao","Ramiro","Raimundo","Raquel","Raul"
  ,"Rebeca","Regina","Reginaldo","Reinaldo","Reinamor","Remo","Renan"
  ,"Renata","Renato","Ricardina","Ricardo","Rita","Roberta","Roberto"
  ,"Rodolfo","Rodrigo","Rogerio","Romao","Romano","Romulo","Ronaldo"
  ,"Roque","Roquita","Rosa","Rosalia","Rosalina","Rosalinda","Rosana"
  ,"Rossana","Rosario","Rosaura","Roseli","Ruben","Rubim","Rudi"
  ,"Rui","Rute","Ruca","Sabina","Sabino","Sabrina","Sacramento"
  ,"Sadi","Sadraque","Sadrudine","Safia","Safira","Salazar","Salemo"
  ,"Sales","Salete","Sali","Salima","Salma","Salomao","Salome"
  ,"Salomite","Saluquia","Salustiano","Salustiniano","Salvacao","Salvador","SalvadordeJesus"
  ,"Salviano","Salvina","Samanta","Samara","Samaritana","Samaritano","Samir"
  ,"Samira","Samuel","Sancha","Sancho","Sancia","Sancler","Sandra"
  ,"Sandrina","Sandrino","Sandro","Sansao","Santana","Santelmo","Santiago"
  ,"Santos","Sara","Sarah","Sarai","Sarina","Sario","Sasquia"
  ,"Sassia","Satia","Satira","Satiro","Saul","Saula","Saulina"
  ,"Saulo","Sauro","Savio","Sebastiana","Sebastiao","Secundino","Sefora"
  ,"Segismundo","Selena","Selene","Selenia","Selesa","Selesia","Selesio"
  ,"Seleso","Selma","Selmo","Semiramis","Sena","Senia","Senio"
  ,"Seomara","Serafim","Serafina","Serena","Serenela","Sergio","Sesinando"
  ,"Sesira","Severiano","Severino","Sextina","Sheila","Sibila","Siddartha"
  ,"Sidnei","Sidonio","Sidraque","Siena","Sifredo","Silas","Silvana"
  ,"Silvandira","Silvano","Silverio","Silvestre","Silvia","Silvia","Silviana"
  ,"Silviano","Silvio","Simao","Simara","Simaura","Simauro","Simeao"
  ,"Simone","Simoneta","Simplicio","Sindulfo","Sinesio","Sira","Siria"
  ,"Sirla","Sisenando","Sisinio","Sisnando","Sivio","Socorro","Socrates"
  ,"Soeiro","Sofia","Sol","Solana","Solange","Solano","Soledade"
  ,"Solene","Solongia","Sonia","Soraia","Sotero","Stela","Stelina"
  ,"Suati","Sueli","Sulamita","Sunamita","Suraje","Surendralal","Suri"
  ,"Suria","Susana","SusanaFrancisco","SusanaIlidia","Susano","Suse","Susete"
  ,"Susi","Tauane","Tabita","Taciana","Taciano","Tacio","Tadeu"
  ,"Tais","Taisa","Taissa","Talia","Talio","Talita","Tamar"
  ,"Tamara","Tamar","Tamiris","Tanagra","Tania","Tarcisio","Tarina"
  ,"Tarsicio","Tasia","Tasso","Tatiana","Tatiano","Tejala","Teliano"
  ,"Telma","Telmo","Telo","Teodemiro","Teodomiro","Teodora","Teodoro"
  ,"Teofilo","Tercio","Teresa","Teresca","Teresina","Teresinha","Terezinha"
  ,"Teseu","Tiago","Tiana","Tiara","Tiberio","Tiburcio","Ticiana"
  ,"Ticiano","Tierri","Timoteo","Tirsa","Tirso","Tirza","Tita"
  ,"Titania","Tito","Tobias","Toledo","Tomas","Tome","Toni"
  ,"Torcato","Torpecia","Torquato","Traciana","Trajano","Trasila","Trindade"
  ,"Tristao","Tude","Tulio","Tulipa","Turgo","Ubaldino","Ubaldo"
  ,"Udo","Uldarico","Uldrico","Ulisses","ulpia","Ulpiana","Ulpiano"
  ,"ulpio","ulfilas","Ulfrida","Ulfrido","Ulrica","Ulrico","Umbelina"
  ,"Umbelino","Urania","Uranio","Urbalina","Urbalino","Urbanila","Urbina"
  ,"Urbino","Urbiria","Urias","Uriel","Urien","Urraca","Ursa"
  ,"Ursacio","Ursanio","Ursiao","Ursicia","Ursicio","Ursiciana","Ursicino"
  ,"Urso","ursula","Ursulina","Ursulino","ursulo","Uziel","Valdemar"
  ,"Valentim","Valentina","Valeria","Valerio","Valmor","Valter","Vanda"
  ,"Vanessa","Vania","Vasco","Vera","Verissimo","Veronica","Verter"
  ,"Vestina","Vianei","Vicencia","Vicenta","Vicente","Victor","Victoria"
  ,"Vida","Vidal","Vidalio","Vidaul","Vilar","Vilator","Vili"
  ,"Vilma","Vilmar","Vilson","Vinicia","Vinicio","Violante","Violeta"
  ,"Violinda","Virgilio","Virginio","Virgulino","Viriato","Vital","Vitalia"
  ,"Vitaliano","Vitalio","Vitiza","Vito","Vitor","Vitoria","Vitorio"
  ,"Vivalda","Vivaldo","Vivelinda","Viveque","Viviana","Viviane","Vivilde"
  ,"Vivina","Vladimiro","Wersun","Xavier","Xenia","Xenio","Xenocrates"
  ,"Xenon","Xerxes","Xica","Xico","Ximena","Xisto","Yara"
  ,"Yasmin","Yolanda","Yuri","Zacarias","Zahra","Zaido","Zaida"
  ,"Zaira","Zairo","Zamy","Zaqueu","Zara","Zara","Zarco"
  ,"Zardilaque","Zarina","Ze","Zeferina","Zelia","ZelindaO","Zelio"
  ,"Zena","Zenaida","Zenaide","Zenia","Zera","Zila","Zilda"
  ,"Zilia","Zilma","Zita","Ziza","Zoa","Zobaida","Zoe"
  ,"Zola","Zora","Zoraida","Zubaida","Zubeida","Zulaia","Zuleica","Zulmira"
  ]


listaEmpresas :: [String]
listaEmpresas =
  ["Taxis VS Ubers", "Crazy Drivers", "Fast N Furious", "On Time"
  , "Taxistas", "Mad Drivers", "Time", "UMer", "Baby Driver"
  , "Lift" , "GeTit", "Wings"
  ]

listaNum ::[String]
listaNum =
  ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16",
  "17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32",
  "33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48",
  "49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64",
  "65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80",
  "81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96",
  "97","98","99"
  ]

listaNumDiasF ::[String]
listaNumDiasF =
  ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16",
  "17","18","19","20","21","22","23","24","25","26","27","28"
  ]

listaNumDiasF1 ::[String]
listaNumDiasF1 =
  ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16",
  "17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"
  ]

listaNumDiasF0 ::[String]
listaNumDiasF0 =
  ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16",
  "17","18","19","20","21","22","23","24","25","26","27","28","29","30"
  ]

listaNumMes ::[String]
listaNumMes =
  ["01","02","03","04","05","06","07","08","09","10","11","12"
  ]
